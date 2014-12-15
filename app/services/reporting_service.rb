class ReportingService 

	attr_reader :from_date, :to_date
	
	def initialize(report_params)
		@report_params = report_params	

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
					submission.pain_severity
				]

				# TODO: Populate with the values for each answer based on the headers
				csv << arr
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
			"pain_severity"
		]

		# => Get the headers for all the questions
		header_arr << get_question_headers
		header_arr.flatten
	end

	def get_question_headers 		
		question_header_arr = []

		# => Take the full survey and loop through all the questions
		Survey.full.first.questions.each do |question|

			# => Populate the headers based on the choices.
			# => Each submission will have a full header of the questions and choices and will populate the answer under the corresponding column.
			# => This is because a question can have multiple answers
			question_header_arr << get_question_choice_headers(question)
		end

		question_header_arr.flatten
	end

	def get_question_choice_headers(question)
		choice_arr = []
		
		question.choices.each do |choice|			
			if choice.content
				# => If the choice has content (some don't)
				# => Then use that has the header
				choice_arr << "#{question.name}_#{choice.content}"
			else
				# => Default to the question name for questions that have choices without content.  (Text questions)
				choice_arr << question.name
			end
		end

		choice_arr
	end

end