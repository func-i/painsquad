module Api
  module V1
    class SessionsController < BaseController
      skip_before_action :restrict_access

      swagger_controller :sessions, 'Sessions Controller'

      swagger_api :create do
        summary 'Creates user session'
        param :path, :email, :string, :required, 'User Email'
        param :path, :password, :string, :required, 'User Password'
        response :unauthorized
      end

      def create
        if @user = login(params[:session][:email], params[:session][:password])
          render json: @user
        else
          render json: { error: "Login failed" }, status: 401
        end
      end

      def destroy
        logout
      end

    end
  end
end
