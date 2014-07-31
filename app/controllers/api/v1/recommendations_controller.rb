module Api
  module V1
    class RecommendationsController < BaseController
      before_action :fetch_recommendations, only: :show

      swagger_controller :recommendations, 'Recommendations Controller'

      swagger_api :show do
        summary 'Returns random recommendations, weighted for user favorites'
        response :not_found
      end

      def show
        if @recommendations
          render json: @recommendations
        else
          render json: nil, status: 404
        end
      end

      swagger_api :prevent do
        summary 'Returns pain prevention recommendations'
        response :not_found
      end

      def prevent
        @recommendations = Recommendation.prevent
        if @recommendations
          render json: @recommendations
        else
          render json: nil, status: 404
        end
      end

      swagger_api :manage do
        summary 'Returns pain management recommendations'
        response :not_found
      end

      def manage
        @recommendations = Recommendation.manage
        if @recommendations
          render json: @recommendations
        else
          render json: nil, status: 404
        end
      end

      private

      def fetch_recommendations
        @recommendations = RecommendationService.new(@user).get_recommendations
      end
    end
  end
end
