# Survey Service, responsible for deciding which survey to send to client
# based off User's previous survey pain_severity level
class SurveyService

  def initialize(user)
    @user   = user
    binding.pry
    @report = @user.reports.last
  end

  def get_survey
    if @report.nil?
      send_survey :full
    elsif @report.pain_severity == 'mild'
      send_survey :truncated
    elsif @report.pain_severity == 'moderate'
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
