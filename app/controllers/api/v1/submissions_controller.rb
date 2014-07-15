module Api
  module V1
    class SubmissionsController < BaseController
      before_action :fetch_submission, only: [:show]

      def show
        render json: @submission
      end

      def create
        @submission      = Submission.new(submission_params)
        @submission.user = @user
        if @submission.save
          # uses custom response serializer to intercept level_up event for client modal
          render json: @submission, serializer: ActivitySerializer
          # prevent this from being called multiple times in a callback
          @submission.user.check_last_three_reports
        else
          render json: {errors: @submission.errors.full_messages}, status: :unprocessable_entity
        end
      end

      private

      def submission_params
        params.require(:submission).permit(
          :survey_id,
          :has_pain,
          answers_attributes: [
            :question_id,
            :choice_id,
            :value,
            :custom_text,
            bodymap_data: [
              head:  [],
              torso: [],
              arms:  [],
              legs:  []
            ]
          ]
        )
      end

      def fetch_submission
        @submission = Submission.includes(:answers).find(params[:id])
      end

    end
  end
end
