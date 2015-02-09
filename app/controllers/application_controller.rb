class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  serialization_scope :present_user

  before_action :restrict_access
  before_action :require_login

  respond_to :json

  force_ssl if: :ssl_configured?  

  def present_user
    @user
  end

  protected

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      api_key = ApiKey.find_by(access_token: token)
      if api_key
        @user = api_key.user
        true
      else
        false
      end
    end
  end

  def not_authenticated
    redirect_to :login
  end

  def ssl_configured?
    Rails.env.production?
  end

end
