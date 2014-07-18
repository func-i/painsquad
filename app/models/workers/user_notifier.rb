module Workers
  class UserNotifier < Struct.new(:user_id, :survey_type)

    def perform
      @user        = User.find(self[:user_id])
      @survey_type = self[:survey_type]

      if @survey_type == :full
        TwilioSms.send_text(@user.phone_number, @survey_type)
        queue_truncated_alert
      elsif @survey_type == :truncated
        TwilioSms.send_text(@user.phone_number, @survey_type)
      end
    end

    protected

    def queue_truncated_alert
      Delayed::Job.enqueue(Workers::UserNotifier.new(@user.id, :truncated), run_at: 1.hour.from_now)
      # Delayed::Job.enqueue(Workers::UserNotifier.new(@user.id, :truncated), run_at: 1.minute.from_now)
    end

  end
end
