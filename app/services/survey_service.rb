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
    elsif @last_submission 
      # => The user had an alert a hour ago and hasn't created a new submission
      if had_alert_within_an_hour?
        send_survey :full        
      else
        send_survey :truncated
      end
    else
      # => Default to the truncated survey
      send_survey :truncated
    end
  end

  protected
  
  def had_alert_within_an_hour?
    last_alert = @user.alerts.where(alert_time: (1.hour.ago - 5.minutes).strftime("%H:%M:%S")..Time.current.strftime("%H:%M:%S")).first
    if last_alert 
      @last_submission.created_at < last_alert.time_today
    else 
      false
    end
  end

  def send_survey type
    Survey.send(type).first
  end

  def send_test_survey
    Survey.where(identifier: :test).first
  end

end
