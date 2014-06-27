class ReportService

  def initialize(user, report_type)
    @user = user
    @report_type = report_type

    # => Get all the user's submissions
    # => TODO: Only get the submissions between a date period
    @submissions = Submission.where(user_id: @user.id)
    @graph_data = {}
  end

  def report_data
    case @report_type
    when "action"
      action_data
    when "cause"
      cause_data
    end

    {report: @graph_data}
  end

  def action_data
    # => Loop through the submissions to add the to graphing data
    @submissions.each do |submission|

      # => Find the medical question in the survey
      med_question = submission.survey.questions.where(tag: 'medications').first

      # => If the submission has the medical question
      if med_question

        # => Load the answers for the medical question
        answers = submission.answers.where(question_id: med_question.id)

        answers.each do |answer|
          @graph_data[answer.choice.content] ||= {
            count: 0,
            total: 0
          }

          # => Increment the number of times this was answered
          @graph_data[answer.choice.content][:count] += 1
          @graph_data[answer.choice.content][:total] = @graph_data[answer.choice.content][:total] + answer.value
          @graph_data[answer.choice.content][:average] = @graph_data[answer.choice.content][:total] / @graph_data[answer.choice.content][:count]
        end

      end
    end
  end

  def cause_data
    @submissions.each do |submission|

      # => Find the medical question in the survey
      pain_question = submission.survey.questions.where(tag: 'pain_cause').first

      # => If the submission has the medical question
      if pain_question
         # => Load the answers for the medical question
        submission.answers.where(question_id: pain_question.id).each do |answer|
          @graph_data[answer.choice.content] ||= 0
          @graph_data[answer.choice.content] += 1
        end
      end
    end
  end
end