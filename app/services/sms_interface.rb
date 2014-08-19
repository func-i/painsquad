class SmsInterface
  require 'twilio-ruby'

  def initialize(user_number, message_type = nil)
    @twilio_client = initialize_client
    @twilio_number = Rails.application.secrets.twilio_phone_number
    @user_number   = user_number
    @message_type  = message_type
    @message       = determine_message
  end

  def send_text
    @twilio_client.account.sms.messages.create(
      :from => "+1#{@twilio_number}",
      :to   => @user_number,
      :body => @message
    )
  end

  protected

  def initialize_client
    twilio_sid   = Rails.application.secrets.twilio_sid
    twilio_token = Rails.application.secrets.twilio_token
    Twilio::REST::Client.new twilio_sid, twilio_token
  end

  def determine_message
    if @message_type == :full
      return full_message
    elsif @message_type == :truncated
      return truncated_message
    else
      return full_message
    end
  end

  def full_message
    "This is a reminder from PainSquad that its time to complete a full case!"
  end

  def truncated_message
    "This is a follow-up reminder from PainSquad to complete a truncated case!"
  end

end