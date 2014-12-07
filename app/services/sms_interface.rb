class SmsInterface
  require 'twilio-ruby'

  def initialize(user_number)
    @twilio_client = initialize_client
    @twilio_number = Rails.application.secrets.twilio_phone_number
    @user_number   = user_number
  end

  def send_text(message)
    @twilio_client.account.sms.messages.create(
      :from => "+1#{@twilio_number}",
      :to   => @user_number,
      :body => message
    )
  end

  protected

  def initialize_client
    twilio_sid   = Rails.application.secrets.twilio_sid
    twilio_token = Rails.application.secrets.twilio_token
    Twilio::REST::Client.new twilio_sid, twilio_token
  end
end