module Api
  module V1
    class AchievementsController < BaseController

      swagger_controller :achievements, 'Achievements Controller'

      swagger_api :show do
        summary 'Returns User Achievements'
        response :unauthorized
      end

      def show
        if @user
          render json: @user, serializer: AchievementsSerializer
        else
          render json: nil, status: 404
        end
      end

    end
  end
end
