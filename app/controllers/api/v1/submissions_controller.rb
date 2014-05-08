module Api
  module V1
    # Submission Controller, accepts POST to create Submission Tree
    class SubmissionsController < ApplicationController
      before_action :fetch_submission, only: [:show]
      # skip_before_action :restrict_access

      def show
        render json: @submission
      end

      def create
        binding.pry
        if (@submission = Submission.create(submission_params))
          render json: @submission.to_json
        else
          render json: nil, status: :unprocessable_entity
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
            { :data_object => [] }
          ]
        )
        # params.require(:submission).permit(
        #   :survey_id,
        #   :has_pain,
        #   answers_attributes: [:question_id, :choice_id, :value, :custom_text,
        #     data_object: []
        #   ]
        # )
      end

      def fetch_submission
        @submission = Submission.includes(:answers).find(params[:id])
      end
    end
  end
end
