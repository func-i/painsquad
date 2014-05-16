module Api
  module V1
    class SurveysController < ApplicationController
      # skip_before_action :restrict_access
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
      def fetch_survey
        @survey = Survey.includes(questions: [:choices]).first
      end
    end
  end
end
