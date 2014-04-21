module Api
  module V1
    class ThingsController < ApplicationController
      before_action :set_thing, only: [:show, :edit, :update, :destroy]

      def greet
        render :json => { message: "Gotta set CORS headers" }.as_json
      end

      def index
        @things = Thing.all
        render json: @things
      end

      def show
        render json: @thing
      end

      def new
        @thing = Thing.new
        render json: @thing
      end

      def edit
        render json: @thing
      end

      def create
        @thing = Thing.new(thing_params)

        if @thing.save
          render json: @thing, status: :created, location: @thing
        else
          render json: @thing.errors, status: :unprocessable_entity
        end
      end

      def update
        if @thing.update(thing_params)
          head :no_content
        else
          render json: @thing.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @thing.destroy
        head :no_content
      end

      private

      def set_thing
        @thing = Thing.find(params[:id])
      end

      def thing_params
        params.require(:thing).permit(:name, :type)
      end

    end
  end
end
