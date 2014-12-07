module Workers
  class UserNotifier < Struct.new(:user_id, :message)

    def perform
      @user        = User.find(self[:user_id])
      @message = self[:message]

      determine_notification_type
    end

    protected

    def determine_notification_type
      if @user.device_token?
        PushInterface.new(@user.device_token).send_message(@message)
      elsif @user.phone_number?
        SmsInterface.new(@user.phone_number).send_text(@message)
      else
        logger.info "No valid token or phone number for User ID: #{@user.id}"
      end
    end
  end
end
