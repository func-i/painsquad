module Api
  module V1
    class SurveyResultsController < ApplicationController

      def show
        render json: @user, serializer: SurveyResultsSerializer
      end

      private

    end
  end
end
