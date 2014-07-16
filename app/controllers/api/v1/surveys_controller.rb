module Api
  module V1
    class SurveysController < BaseController
      before_action :fetch_survey

      def show
        if @survey
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
