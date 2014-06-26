class ReportService

  def initialize(user)
    @user = user
  end

  def report_data
    # => Get all the user's submissions
    # => TODO: Only get the submissions between a date period
    submissions = Submission.where(user_id: @user.id)

    graph_data = {}

    # => Loop through the submissions to add the to graphing data
    submissions.each do |submission|

      # => Find the medical question in the survey
      med_question = submission.survey.questions.where(question_type: 'checklist-extra').first

      # => If the submission has the medical question
      if med_question

        # => Load the answers for the medical question
        answers = submission.answers.where(question_id: med_question.id)

        answers.each do |answer|
          graph_data[answer.choice.content] ||= {
            count: 0,
            total: 0
          }

          # => Increment the number of times this was answered
          graph_data[answer.choice.content][:count] += 1
          graph_data[answer.choice.content][:total] = graph_data[answer.choice.content][:total] + answer.value
          graph_data[answer.choice.content][:average] = graph_data[answer.choice.content][:total] / graph_data[answer.choice.content][:count]

        end

      end
    end

    {data: graph_data}
  end
end