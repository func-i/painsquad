module PainReporting
  extend ActiveSupport::Concern

  included do
  end

  # With No Pain OR/ No improvement detected (i.e. first assessment) (7.9a)
  BEST = "The case against pain is getting stronger every day! Keep up the good work and there may be a promotion in your future…maybe even a commendation or award!"

  # With Pain >20 point improvement from last (7.9b)
  BETTER= "Wow! You’re really putting pain in its place. Continue the great job recruit!"

  # With Pain <20 point improvement or pain worsening (7.9b)
  OK = "Keep up with the advice you’ve been using. You might even want to seek more help."

  # really bad pain severity determination
  # takes last three pain reports
  # scores them, if nil or mild, subtract 1
  # if moderate, add 1
  # determines message from that result
  def determine_pain_severity_message
    result = 0
    last_three_reports.each do |report|
      if report.pain_severity == nil || report.pain_severity == 'mild'
        result -= 1
      else
        result += 1
      end
    end
    render_message(result)
  end

  def render_message(result)
    if result < 0
      BEST
    elsif result > 0
      OK
    else
      BETTER
    end
  end

  def check_last_three_reports
    moderate_pain_submissions = self.submissions.where(pain_severity: Submission.pain_severities[:moderate])
    if last_three_reports.collect(&:pain_severity).all? { |value| value == 'moderate' } && (moderate_pain_submissions % (self.alert_email_count * 3) >= 3)
      UserMailer.pain_alert(self).deliver
      self.update(alert_email_count: self.alert_email_count + 1)
      return true
    else
      return false
    end
  end

  def last_three_reports
    previous_submissions.limit(3)
  end

end
