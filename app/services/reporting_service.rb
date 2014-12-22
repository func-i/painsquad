class ReportingService 

	attr_reader :from_date, :to_date
	
	def initialize(report_params)		
		@report_params = report_params	

		@header_hash = {}

		# => Parse the from and to date
		parse_date

		# => Load the submissions based on the params
		load_submissions
	end

	def generate
		require 'csv'

		# => Start creating the CSV
		CSV.generate do |csv|

			# => Load all the headers for the questions
			# => The headers will be the same for every row and are based on the FULL survey
			csv << create_headers

			# => Loop through each submission and populate a row
			@submissions.each do |submission|			
				# => Start with some default values
				arr = [
					submission.created_at,
					submission.user.try(:username),
					submission.user.try(:email),
					submission.user.try(:phone_number),
					submission.user.try(:healthcare_provider_email),
					submission.pain_severity || 'SKIP'
				]

				arr << get_answer_values(submission)

				# TODO: Populate with the values for each answer based on the headers
				csv << arr.flatten
			end
		end
	end

	protected

	def parse_date
		# => The date is loaded from a date_select which comes in with 3 params.
		# => If the selector is changed, this is where the date parsing is to be changed.
		from_date_str = "#{@report_params['from(1i)']}-#{@report_params['from(2i)']}-#{@report_params['from(3i)']}"
		@from_date = Date.parse(from_date_str)

		to_date_str = "#{@report_params['to(1i)']}-#{@report_params['to(2i)']}-#{@report_params['to(3i)']}"
		@to_date = Date.parse(to_date_str)
	end

	def load_submissions
		# => Load the submissions from the params here.
		@submissions = Submission.between(@from_date, @to_date)	
	end

	def create_headers

		# => Populate default header values here
		header_arr = [
			"submission_date",
			'username',
			'user_email',
			'user_phone_number',
			'healthcare_provider_email',
			"pain_severity"
		]

		# => Get the headers for all the questions
		get_question_headers
		
		header_arr << @header_hash.keys
		header_arr.flatten
	end

	def get_question_headers
		# => Take the full survey and loop through all the questions
		Survey.all.each do |survey|
			survey.questions.order("id ASC").each do |question|
				# => Populate the headers based on the choices.
				# => Each submission will have a full header of the questions and choices and will populate the answer under the corresponding column.
				# => This is because a question can have multiple answers
				get_question_choice_headers(question)
			end
		end
	end

	def get_question_choice_headers(question)		
		question.choices.each do |choice|			
			if choice.content
				# => If the choice has content (some don't)
				# => Then use that has the header

				if choice.textfield
					hsh = @header_hash["#{question.name}_#{choice.content}_textfield"] ||= []
					@header_hash["#{question.name}_#{choice.content}_textfield"] << {
						question_id: question.id,
						choice_id: choice.id,
						textfield: true
					}
				end

				hsh = @header_hash["#{question.name}_#{choice.content}"] ||= []
				@header_hash["#{question.name}_#{choice.content}"] << {
					question_id: question.id,
					choice_id: choice.id,
					bodymap: question.question_type.eql?('bodymap'),
					choice_name: choice.content
				}
			else
				# => Default to the question name for questions that have choices without content.  (Text questions)
				@header_hash[question.name] ||= []
				@header_hash[question.name] << {
					question_id: question.id,
					choice_id: choice.id					
				}				
			end
		end
	end

	def get_answer_values(submission)
		values = []
		@header_hash.each_pair do |header, arr|
			found = false			
			arr.each do |hsh|
				answer = submission.answers.where(question_id: hsh[:question_id], choice_id: hsh[:choice_id]).first								
				#binding.pry
				if answer					
					values << parse_answer(answer, hsh)				
					found = true
				else					
					case header
					when "has_pain_Yes"
						if submission.has_pain
							values << 'X'						
							found = true
							break
						end
					when "has_pain_No"
						unless submission.has_pain
							values << 'X'
							found = true
							break						
						end
					end
				end		
			end

			values << nil unless found
		end
		values		
	end

	def parse_answer(answer, hsh)				
		question = answer.question
		case question.question_type
		when "slider", 'checklist'			
			answer.value || 'X'
		when 'checklist-extra'
			if hsh[:textfield]
				answer.custom_text
			else
				answer.value
			end
		when "radio", "checklist-grid"
			'X'
		when "bodymap"
			answer.bodymap_data[hsh[:choice_name].downcase].join(",")
		when 'textbox'
			answer.custom_text
		end
	end

end