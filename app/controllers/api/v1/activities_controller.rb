module Api
  module V1
    class ActivitiesController < BaseController

      swagger_controller :activities, 'Activities Controller'

      swagger_api :create do
        summary 'Stores user events to Activity table'
        param :form, :subject_id, :integer, :required, 'Subject ID'
        param :form, :subject_type, :string, :required, 'Subject Type'
        param :form, :event, :string, :required, 'Event'
        response :unprocessable_entity
      end

      def create
        @activity      = Activity.new(activity_params)
        @activity.user = @user
        if @activity.save
          render json: @activity
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
