module Api
  module V1
    class AchievementsController < BaseController

      def show
        render json: @user, serializer: AchievementsSerializer
      end

    end
  end
end
