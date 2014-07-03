class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  serialization_scope :present_user

  before_action :restrict_access
  respond_to :json

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

  def user_not_authorized
    flash[:alert] = 'Access denied'
    redirect_to request.referrer || root_path
  end
end
