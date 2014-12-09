module PainReporting
  extend ActiveSupport::Concern

  included do
  end

  # With No Pain OR/ No improvement detected (i.e. first assessment) (7.9a)
  OK = "The case against pain is getting stronger every day! Keep up the good work and there may be a promotion in your future…maybe even a commendation or award!"
  # With Pain >20 point improvement from last (7.9b)
  BETTER= "Wow! You’re really putting pain in its place. Continue the great job recruit!"
  # With Pain <20 point improvement or pain worsening (7.9b)
  WORSE = "Keep up with the advice you’ve been using. You might even want to seek more help."

  # really bad pain severity determination
  # takes last three pain reports
  # scores them, if nil or mild, subtract 1
  # if moderate, add 1
  # determines message from that result
  def determine_pain_severity_message

    # => Get the last 2 submissions
    last_submissions = previous_submissions.limit(2)

    # => If there are at least 2 submissions
    if last_submissions.count == 2
      
      # => Get the different between their current_pain questions
      current_pain, previous_pain = last_submissions.collect{|sub| sub.current_pain_answer.try(:value) || 0}
      if current_pain < previous_pain - 20
        # => The pain has improved by 20
        BETTER
      elsif current_pain > previous_pain + 20
        # => The pain has gotten worse by 20
        WORSE
      else
        OK
      end
    else
      # => There aren't at least 2 results, show the OK by default
      OK
    end
  end

  def check_last_three_reports
    # => Load the last mild submission
    last_mild = previous_submissions.are_mild.first
    if last_mild
      # => Find all moderate submissions after this mild one
      if previous_submissions.are_moderate.where("created_at > ?", last_mild.created_at).count % 3 == 0
        # => Send an email in intervals of 3 moderates
        UserMailer.pain_alert(self).deliver
      end
    end
  end

end
