class PushInterface

  def initialize(user_token, message_type = nil)
    @client       = $SNS.client
    @token        = user_token
    @endpoint     = create_endpoint
    @message_type = message_type
    @message      = determine_message
  end

  def send_message
    push_parameters = {
      target_arn:        @endpoint,
      message_structure: "json",
      message:           @message
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
    { "default" => "This is a reminder from PainSquad that its time to complete a full case!" }.to_json
  end

  def truncated_message
    { "default" => "This is a follow-up reminder from PainSquad to complete a truncated case!" }.to_json
  end

end