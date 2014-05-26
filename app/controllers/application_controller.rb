# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.

# class ApplicationController < ActionController::API
class ApplicationController < ActionController::Base

  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: proc { |c| c.request.format.json? }
  before_action :restrict_access
  respond_to :json

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      binding.pry
      api_key = ApiKey.find_by_access_token(token)
      if api_key
        @user = api_key.user
        true
      else
        false
      end
    end
  end

  # def restrict_access
  #   unless logged_in?
  #     render json: { error: 'Authentication required' }, status: :unauthorized
  #   end
  # end

  def user_not_authorized
    flash[:alert] = 'Access denied'
    redirect_to request.referrer || root_path
  end
end
