class PushInterface
  @@client = $SNS.client
  GUSTAVO  = '8cec5894e97a0b22379e577eb9b9c9e4c5fc7d9a1c0f47657f9d8c54015d4f7b'

  def self.send_message
    response = @@client.create_platform_endpoint(
      platform_application_arn: Rails.application.secrets.aws_application_arn,
      token:                    GUSTAVO
    )
    endpoint_arn = response[:endpoint_arn]

    message = {
      "default" => "Hello World from default",
      "APNS" => {
        "aps"     => { "content-available" => true },
        "message" => "Hello World from APNS"
      }.to_json,
      "APNS_SANDBOX" => {
        "aps"     => { "content-available" => true },
        "message" => "Hello World from APNS_SANDBOX"
      }.to_json
    }

    push_parameters = {
      target_arn: endpoint_arn,
      message_structure: "json",
      message: message
    }
    response = @@client.publish(push_parameters)
  end

end