module Api
  module V1
    class RankingsController < ApplicationController

      def show
        render json: @user, serializer: RankingSerializer
      end

    end
  end
end
