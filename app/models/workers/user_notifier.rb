module Workers
  class UserNotifier < Struct.new(:user_id, :survey_type)

    def perform
      @user        = User.find(self[:user_id])
      @survey_type = self[:survey_type]

      if @survey_type == :full
        determine_notification_type
        queue_truncated_alert
      elsif @survey_type == :truncated
        determine_notification_type
      end
    end

    protected

    def determine_notification_type
      if @user.device_token?
        PushInterface.new(@user.device_token, @survey_type).send_message
      elsif @user.phone_number?
        SmsInterface.new(@user.phone_number, @survey_type).send_text
      else
        logger.info "No valid token or phone number for User ID: #{@user.id}"
      end
    end

    def queue_truncated_alert
      Delayed::Job.enqueue(Workers::UserNotifier.new(@user.id, :truncated), run_at: 1.hour.from_now)
      #Delayed::Job.enqueue(Workers::UserNotifier.new(@user.id, :full), run_at: 15.minute.from_now)
    end

  end
end
