module Api
  module V1
    class SurveysController < ApplicationController
      # before_action :get_survey
      # skip_before_action :restrict_access

      def index
        @surveys = Survey.all
        render json: @surveys
      end

      # def show
      #   render json: @survey
      # end

      private

      def get_survey
        @survey = Survey.includes(questions: [:choices]).find params[:id]
      end

    end
  end
end
