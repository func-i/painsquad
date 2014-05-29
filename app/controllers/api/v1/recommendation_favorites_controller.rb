module Api
  module V1
    class RecommendationFavoritesController < ApplicationController

      # TODO: fix this, weird params bug and need to create batch records
      def create
        @recommendation_faves = RecommendationFavorite.new(
          recommendation_id: recommendation_params,
          user: @user
        )
        if @recommendation_faves.save
          render json: @recommendation_faves
        else
          render json: { errors: @recommendation_faves.errors.full_messages}, status: :unprocessable_entity
        end
      end

      private

      def recommendation_params
        params.require(:recommendation_favorite)
      end

    end
  end
end
