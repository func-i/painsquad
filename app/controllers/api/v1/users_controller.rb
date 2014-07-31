module Api
  module V1
    class UsersController < BaseController

      swagger_controller :users, 'Users Controller'

      swagger_api :index do
        summary 'Returns User Information when at Home view'
        response :unauthorized
      end

      def index
        if present_user
          render json: present_user
        else
          render json: nil, status: 401
        end
      end

      private

      def user_params
        params.require(:user).permit(:username, :email, :password)
      end

    end
  end
end
