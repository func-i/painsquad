class PushInterface

  def initialize(user_token)
    @client       = $SNS.client
    @token        = user_token
    @endpoint     = create_endpoint    
  end

  def send_message(message)
    apns_payload = {aps: { alert: message, sound: 'default'}}.to_json
    hsh =  {default: message, "APNS" => apns_payload }.to_json

    push_parameters = {
      target_arn:        @endpoint,
      message_structure: "json",
      message:           hsh
    }
    @client.publish(push_parameters)
  end

  protected

  def create_endpoint
    response = @client.create_platform_endpoint(
      platform_application_arn: Rails.application.secrets.aws_application_arn,
      token:                    @token
    )
    response[:endpoint_arn]
  end

  def full_message
    { "default" => "This is a reminder from PainSquad that its time to complete a case!" }.to_json
  end

  def truncated_message
    { "default" => "This is a follow-up reminder from PainSquad to complete a case!" }.to_json
  end

end