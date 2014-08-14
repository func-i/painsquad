class SurveyService

  def initialize(user)
    @user            = user
    @last_submission = @user.submissions.last
  end

  def get_survey
    return send_test_survey if Rails.env.development?

    if five_minutes_ago?
      send_survey :full
    elsif one_hour_ago?
      send_survey :truncated
    else
      send_from_pain_report
    end
  end

  protected

  # 0:05 to 0:00 ago
  def five_minutes_ago?
    @user.alerts.where(time: 5.minutes.ago.strftime("%H:%M:%S")..Time.current.strftime("%H:%M:%S")).any?
  end

  # 1:05 to 1:00 ago
  def one_hour_ago?
    @user.alerts.where(time: (1.hour.ago - 5.minutes).strftime("%H:%M:%S")..1.hour.ago.strftime("%H:%M:%S")).any?
  end

  # send full survey if its the first
  # no pain in previous report, send truncated
  # otherwise, determine which survey from pain_severity
  def send_from_pain_report
    if @last_submission.nil?
      send_survey :full
    elsif !@last_submission.has_pain?
      send_survey :truncated
    else
      determine_pain_severity
    end
  end

  def determine_pain_severity
    if @last_submission.mild?
      send_survey :truncated
    else
      send_survey :full
    end
  end

  def send_survey type
    Survey.send(type).first
  end

  def send_test_survey
    Survey.where(identifier: :test).first
  end

end
