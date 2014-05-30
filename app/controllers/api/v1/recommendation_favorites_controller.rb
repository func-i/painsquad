module Api
  module V1
    class RecommendationFavoritesController < ApplicationController

      # TODO:
      # - rename model 'Favorites'
      # - POST on each individual favorite select/deselect (with setTimeout to prevent spam)
      # - yeah, clean this up
      def show
        binding.pry
      end

      def create
        if @favorites = RecommendationFavorite.create(array_params)
          render json: @favorites
        else
          render json: { errors: @favorites.errors.full_messages}, status: :unprocessable_entity
        end
      end

      def destroy
        binding.pry
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
