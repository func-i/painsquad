module Api
  module V1
    class SurveysController < ApplicationController
      before_action :fetch_survey

      def show
        if @survey
          render json: @survey
        else
          render json: nil, status: 404
        end
      end

      private

      # TODO: Need to get the survey conditionally based on previous pain report
      # get full survey or build it if it doesn't exist!
      def fetch_survey
        @survey = Survey.where(identifier: 'full').first
        # @survey = SurveyService.new(@user).get_survey
      end
    end
  end
end
