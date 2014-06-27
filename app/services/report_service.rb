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
    when "effect"
      effect_data
    when "pain"
      pain_data
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

  def effect_data
    @submissions.each do |submission|

      # => Get all the effect questions, there are multiple questions unlike
      # => the reports above that have 1 question and multiple answers for it
      submission.survey.questions.where(tag: 'effect').each do |effect_question|

        # => Get the answers for this submission
        submission.answers.where(question_id: effect_question.id).each do |answer|
          @graph_data[effect_question.report_label] ||= {
            count: 0,
            total: 0,
            average: 0
          }

           # => Increment the number of times this was answered
          @graph_data[effect_question.report_label][:count] += 1
          @graph_data[effect_question.report_label][:total] = @graph_data[effect_question.report_label][:total] + answer.value
          @graph_data[effect_question.report_label][:average] = @graph_data[effect_question.report_label][:total] / @graph_data[effect_question.report_label][:count]
        end
      end
    end
  end

  def pain_data
    @submissions.each do |submission|
      submission.survey.questions.where(tag: 'intensity').each do |pain_question|

         # => Get the answers for this submission
        submission.answers.where(question_id: pain_question.id).each do |answer|
          @graph_data[submission.created_at] ||= {
            now: 0,
            worst: 0,
            least: 0,
            average: 0
          }

          @graph_data[submission.created_at][pain_question.report_label.downcase.to_sym] = answer.value
        end
      end
    end
  end
end