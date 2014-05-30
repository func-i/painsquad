module Api
  module V1
    class RecommendationFavoritesController < ApplicationController

      def create
        if @favorites = RecommendationFavorite.create(array_params)
          render json: @favorites
        else
          render json: { errors: @favorites.errors.full_messages}, status: :unprocessable_entity
        end
      end

      private

      def recommendation_params
        params.require(:recommendation_favorite)
      end

      # returns an array of hashes mapping { recommendation_id: id, user_id: @user.id }
      def array_params
        recommendation_params.inject([]) do |result, id|
          result << { recommendation_id: id, user_id: @user.id }
        end
      end

    end
  end
end
