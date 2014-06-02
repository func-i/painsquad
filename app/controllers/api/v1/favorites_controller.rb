module Api
  module V1
    class FavoritesController < ApplicationController

      def index
        binding.pry
      end

      def create
        @favorite      = Favorite.new(favorites_params)
        @favorite.user = @user
        if @favorite.save
          render json: @favorites
        else
          render json: { errors: @favorites.errors.full_messages}, status: :unprocessable_entity
        end
      end

      def destroy
        binding.pry
      end

      private

      def favorites_params
        params.require(:favorite).permit!
      end

    end
  end
end
