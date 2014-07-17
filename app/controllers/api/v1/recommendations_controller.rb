module Api
  module V1
    class RecommendationsController < BaseController
      before_action :fetch_recommendations, only: :show

      def show
        if @recommendations
          render json: @recommendations
        else
          render json: nil, status: 404
        end
      end

      def prevent
        @recommendations = Recommendation.prevent
        render json: @recommendations
      end

      def manage
        @recommendations = Recommendation.manage
        render json: @recommendations
      end

      private

      def fetch_recommendations
        @recommendations = RecommendationService.new(@user).get_recommendations
      end
    end
  end
end
