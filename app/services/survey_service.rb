# Survey Service, responsible for deciding which survey to send to client
# based off User's previous survey pain_severity level
class SurveyService

  def initialize(user)
    @user            = user
    @last_submission = @user.submissions.last
    # @previous        = @user.previous_submissions
  end

  def get_survey
    # TEMP CODE FOR TESTING!
    return send_test_survey if Rails.env.development?

    if @last_submission.nil?
      # send full survey if its the first
      send_survey :full
    elsif !@last_submission.has_pain?
      # no pain in previous report, send truncated
      send_survey :truncated
    else
      # otherwise, determine which survey from pain_severity
      determine_pain_severity
    end
  end

  def send_test_survey
    Survey.where(identifier: :test).first
  end

  def determine_pain_severity
    if @last_submission.mild?
      send_survey :truncated
    else
      send_survey :full
    end
  end

  protected

  # builds surveys if they don't exist
  # returns type specified
  def send_survey type
    Survey.create_surveys! unless Survey.any?
    Survey.send(type).first
  end

end
