access_key = Rails.application.secrets.aws_access_key_id
secret_key = Rails.application.secrets.aws_secret_access_key
$SNS = AWS::SNS.new(:access_key_id => access_key, :secret_access_key => secret_key)

# arn = 'arn:aws:sns:us-east-1::app/APNS/.iOS.Production'
# endpoint = AWS.sns.client.create_platform_endpoint(
#   :platform_application_arn => arn,
#   :token                    => params[:apns_token from_mobile_device],
#   :custom_user_data         => user.id,
#   :attributes               => {}
# )
