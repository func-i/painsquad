# Survey Service, responsible for deciding which survey to send to client
# based off User's previous survey pain_severity level
class SurveyService

  def initialize(user)
    @user                 = user
    @last_submission      = @user.submissions.last
    @previous_submissions = @user.previous_submissions
  end

  # TODO: implement AM/PM alerts - base survey deliver off of that
  # deliver FULL survey for AM/PM alerts (any time within 30 minutes)
  # deliver TRUNCATED survey on 1 hour followup of AM/PM alerts
  def get_survey
    if @last_submission.nil?
      send_survey :full
    elsif @last_submission.mild?
      send_survey :truncated
    elsif @last_submission.moderate?
     send_survey :full
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
