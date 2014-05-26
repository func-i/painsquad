module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :restrict_access

      def create
        logger.info "API Session Params: #{params}"
        unless @user = login(params[:session][:email], params[:session][:password])
          render json: { error: "Login failed" }, status: :unprocessable_entity
        end
      end

      def destroy
        logout
      end

    end
  end
end
