module Api
  module V1
    class ActivitiesController < ApplicationController

      def create
        @activity = Activity.new(activity_params)
        @activity.user = @user
        if @activity.save
          render json: @activity
          Rails.logger.debug '---------SAVING ACTIVITY ADVICE COMPLETED FLAG HERE LOLOL'
          Rails.logger.debug "---------User Score: #{@user.score}"
          Rails.logger.debug "---------User Changes: #{@user.changes}"
          Rails.logger.debug "---------Last 3 User Activities: #{@user.activities.take 3}"
        else
          render json: { errors: @activity.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def activity_params
        params.require(:activity).permit(:subject_id, :subject_type, :event)
      end

    end
  end
end
