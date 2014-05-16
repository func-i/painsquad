# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: proc { |c| c.request.format.json? }

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # respond_to :json
  # before_action :restrict_access

  protected

  def restrict_access
    render json: { error: 'Authentication required' }, status: :unauthorized unless logged_in?
  end

  def user_not_authorized
    flash[:alert] = 'Access denied.'
    redirect_to request.referrer || root_path
  end
end
