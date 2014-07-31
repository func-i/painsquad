module Api
  module V1
    class FavoritesController < BaseController

      swagger_controller :favorites, 'Favorites Controller'

      swagger_api :index do
        summary 'Returns Users recommendation favorites'
        response :unprocessable_entity
      end

      def index
        @favorites = Favorite.includes(:recommendation).where(user_id: @user.id).take(4)
        if @favorites
          render json: @favorites
        else
          render json: { errors: "No favorites" }, status: :unprocessable_entity
        end
      end

      swagger_api :create do
        summary 'Adds a recommendation to User favorites'
        param :form, :recommendation_id, :integer, :required, 'Recommendation ID'
        response :unprocessable_entity
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

      swagger_api :destroy do
        summary 'Removes recommendation from User favorites'
        param :form, :recommendation_id, :integer, :required, 'Recommendation ID'
        response :unprocessable_entity
      end

      def destroy
        @favorite = Favorite.find_by(recommendation_id: params[:id])
        if @favorite.destroy
          head :ok
        else
          render json: nil, status: :unprocessable_entity
        end
      end

      private

      def favorites_params
        params.require(:favorite).permit(:recommendation_id)
      end

    end
  end
end
