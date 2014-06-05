module Api
  module V1
    class SubmissionsController < ApplicationController
      before_action :fetch_submission, only: [:show]

      def show
        render json: @submission
      end

      def create
        @submission         = Submission.new(submission_params)
        @submission_service = SubmissionService.new(@submission, @user)
        if @submission_service.create
          render json: @submission
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
