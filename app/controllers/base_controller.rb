class BaseController < ApplicationController
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  respond_to :json
  # before_filter :restrict_access

  protected

  def restrict_access
    render json: { error: "Authentication required" }, status: :unauthorized if !logged_in?
  end

  def user_not_authorized
    flash[:alert] = "Access denied."
    redirect_to (request.referrer || root_path)
  end

end
