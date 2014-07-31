module Api
  module V1
    class SurveysController < BaseController
      before_action :fetch_survey, only: :show

      swagger_controller :surveys, 'Surveys Controller'

      swagger_api :show do
        summary 'Returns survey'
        response :unauthorized
      end

      def show
        if @survey
          render json: @survey
        else
          render json: nil, status: 404
        end
      end

      swagger_api :full do
        summary 'Returns full survey'
        response :unauthorized
      end

      def full
        if @survey = Survey.full.first
          render json: @survey
        else
          render json: nil, status: 404
        end
      end

      swagger_api :truncated do
        summary 'Returns truncated survey'
        response :unauthorized
      end

      def truncated
        if @survey = Survey.truncated.first
          render json: @survey
        else
          render json: nil, status: 404
        end
      end

      private

      def fetch_survey
        @survey = SurveyService.new(@user).get_survey
      end
    end
  end
end
