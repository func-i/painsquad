module Api
  module V1
    class AchievementsController < ApplicationController

      def show
        render json: @user, serializer: AchievementsSerializer
      end

    end
  end
end
