class TwilioSms
  require 'twilio-ruby'

  def self.send_text(user_phone_number, message_type = nil)
    number_to_send_to = user_phone_number

    if message_type == :full
      message = "This is a reminder from PainSquad that its time to complete a full case!"
    elsif message_type == :truncated
      message = "This is a follow-up reminder from PainSquad to complete a truncated case!"
    else
      message = "This is a reminder from PainSquad that its time to complete a full case!"
    end

    twilio_sid          = Rails.application.secrets.twilio_sid
    twilio_token        = Rails.application.secrets.twilio_token
    twilio_phone_number = Rails.application.secrets.twilio_phone_number

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to   => user_phone_number,
      :body => message
    )
  end

end