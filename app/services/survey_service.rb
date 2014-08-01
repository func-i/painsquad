# Survey Service, responsible for deciding which survey to send to client
# based off User's previous survey pain_severity level
class SurveyService

  def initialize(user)
    @user            = user
    @last_submission = @user.submissions.last
    @now             = Time.zone.now.strftime("%H:%M:%S")
  end

  # if notification was sent in last
  # - 5 minutes of notification?
  #    - send full survey
  # - 1:00 to 1:05 of notification (1hr to 1.05 hr)
  #     - send truncated survey
  # otherwise
  # - determine survey from pain report
  def get_survey
    if within_notification_window?
      send_from_notification_hook
    else
      send_from_pain_report
    end
  end

  protected

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

  def within_notification_window?
    @user.alerts.each do |alert|
    end
  end

  def send_from_notification_hook
  end

  def send_survey type
    Survey.send(type).first
  end

  def send_test_survey
    Survey.where(identifier: :test).first
  end

end
