class SurveyService

  def initialize(user)
    @user            = user
    @last_submission = @user.submissions.last
  end

  def get_survey    
    # => Allow an admin to force the next survey to be a full one.
    # => This was initially done for development testing, but thought it might be useful as an admin feature in the future.
    if @user.force_full_survey
      @user.update(force_full_survey: false)
      send_survey :full      
    elsif five_minutes_ago? || one_hour_ago?
      send_survey :full
    else
      send_survey :truncated
    end
  end

  protected

  # 0:05 to 0:00 ago
  def five_minutes_ago?
    @user.alerts.where(alert_time: 5.minutes.ago.strftime("%H:%M:%S")..Time.current.strftime("%H:%M:%S")).any?
  end

  # 1:05 to 1:00 ago
  def one_hour_ago?
    @user.alerts.where(alert_time: (1.hour.ago - 5.minutes).strftime("%H:%M:%S")..1.hour.ago.strftime("%H:%M:%S")).any?
  end

  def send_survey type
    Survey.send(type).first
  end

  def send_test_survey
    Survey.where(identifier: :test).first
  end

end
