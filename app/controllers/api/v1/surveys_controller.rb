module Api
  module V1
    class SurveysController < ApplicationController
      # skip_before_action :restrict_access
      before_action :get_survey

      def show
        render json: @survey
      end

      private

      # TODO: Need to get the survey conditionally based on User state (previous pain report)
      def get_survey
        @survey = Survey.includes(questions: [:choices]).first
      end

    end
  end
end
