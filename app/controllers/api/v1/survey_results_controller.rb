module Api
  module V1
    class SurveyResultsController < BaseController

      def show
        render json: @user, serializer: SurveyResultsSerializer
      end

      private

    end
  end
end
