module Api
  module V1
    class SurveyResultsController < BaseController

      swagger_controller :survey_results, 'Survey Results Controller'

      swagger_api :show do
        summary 'Returns survey results information after submission'
        response :unauthorized
      end

      def show
        if @user
          render json: @user, serializer: SurveyResultsSerializer
        else
          render json: nil, status: 404
        end
      end

      private

    end
  end
end
