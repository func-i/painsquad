module Api
  module V1
    class ActivitiesController < ApplicationController

      def create
        @activity = Activity.new(activity_params)
        @activity.user = @user
        if @activity.save
          render json: @activity
        else
          render json: { errors: @activity.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # def create
      #   @activity         = Activity.new(activity_params)
      #   @activity_service = ActivityService.new(@activity, @user)
      #   if @activity_service.create
      #     head :ok
      #   else
      #     render json: { errors: @activity.errors.full_messages }, status: :unprocessable_entity
      #   end
      # end

      private

      def activity_params
        params.require(:activity).permit(:subject_id, :subject_type, :event)
      end

    end
  end
end
