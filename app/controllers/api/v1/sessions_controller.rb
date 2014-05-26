module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :restrict_access

      def create
        if @user = login(params[:session][:email], params[:session][:password])
          head :ok
        else
          render json: { error: "Login failed" }, status: :unprocessable_entity
        end
      end

      def destroy
        logout
      end

    end
  end
end
