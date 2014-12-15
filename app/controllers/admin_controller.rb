class AdminController < ApplicationController

	skip_before_action :restrict_access
	before_action :require_login
	before_action :require_admin

	protected

	def require_admin
		if current_user && !current_user.admin?
			redirect_to :login, alert: "Access Denied"
		end
	end

end