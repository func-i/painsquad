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

      # TODO: Need to populate advice -> recommendations based upon some
      # requirements specified by SickKids
      # also, speed up this query, it sucks
      def fetch_advice
        @recommendations = RecommendationService.new(@user).get_recommendations
      end
    end
  end
end
