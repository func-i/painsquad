module Api
  module V1
    class SubmissionsController < ApplicationController
      before_action :get_submission, only: [:show]
      # skip_before_action :restrict_access

      def show
        render json: @submission
      end

      def create
        @submission = Submission.create(submission_params)
        binding.pry
        # if @submission = Submission.create(submission_params)
        #   render json: @submission.to_json
        # else
        #   render json: nil, status: :unprocessable_entity
        # end
      end

      private

      def submission_params
        params.require(:submission).permit(:survey_id, :has_pain)
      end

      def answer_params
        params[:submission][:answers_attributes] ||= []
        params.require(:submission).permit(
          answers_attributes: [
            :question_id, :question_type, :content, :tip,
              choices: [
                :id, :content, :value, :textfield, :selected
              ]
            ]
          )
      end

      def get_submission
        @submission = Submission.includes(:answers).find params[:id]
      end

    end
  end
end
