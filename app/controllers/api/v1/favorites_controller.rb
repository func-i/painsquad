module Api
  module V1
    class FavoritesController < ApplicationController
      before_action :fetch_favorite, only: :destroy

      def index
        binding.pry
      end

      def create
        @favorite      = Favorite.new favorites_params
        @favorite.user = @user
        if @favorite.save
          render json: @favorite
        else
          render json: { errors: @favorite.errors.full_messages}, status: :unprocessable_entity
        end
      end

      def destroy
        if @favorite.destroy
          head :ok
        end
      end

      private

      def favorites_params
        params.require(:favorite).permit!
      end

      def fetch_favorite
        @favorite = Favorite.find_by(recommendation_id: params[:id])
      end

    end
  end
end
