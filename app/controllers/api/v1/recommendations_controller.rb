module Api
  module V1
    class RecommendationsController < ApplicationController
      before_action :fetch_recommendations

      def show
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
