module Api
  module V1
    class UsersController < ApplicationController
      # skip_before_action :restrict_access, only: [:create]

      def index
        render json: present_user
      end

      def create
        @user = User.new user_params

        unless @user.save
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:username, :email, :password)
      end

    end
  end
end
