require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable
  skip_before_action :verify_authenticity_token, :restrict_access, :require_login
  after_action :set_header

  def send_text_message
    # number_to_send_to = params[:number_to_send_to]
    number_to_send_to = "6477797484"

    twilio_sid          = Rails.application.secrets.twilio_sid
    twilio_token        = Rails.application.secrets.twilio_token
    twilio_phone_number = Rails.application.secrets.twilio_phone_number

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to   => number_to_send_to,
      :body => "This is a reminder from PainSquad that it is time to complete a case!"
    )
  end

end