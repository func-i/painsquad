module Api
  module V1
    class FavoritesController < BaseController
      before_action :fetch_favorite, only: :destroy

      def index
        @favorites = Favorite.includes(:recommendation).where(user_id: @user.id).take(4)
        if @favorites
          render json: @favorites
        else
          render json: { errors: "No favorites" }
        end
      end

      def create
        @favorite      = Favorite.new(favorites_params)
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
        params.require(:favorite).permit(:recommendation_id)
      end

      def fetch_favorite
        @favorite = Favorite.find_by(recommendation_id: params[:id])
      end

    end
  end
end
