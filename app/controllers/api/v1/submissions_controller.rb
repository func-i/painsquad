module Api
  module V1
    class SubmissionsController < ApplicationController
      before_action :get_submission, only: [:show]
      # skip_before_action :restrict_access

      def show
        render json: @submission
      end

      def create
        if @submission = Submission.create(submission_params)
          render json: @submission.to_json
        else
          render json: nil, status: :unprocessable_entity
        end
      end

      private

      def submission_params
        params[:submission][:answers_attributes] ||= []
        params.require(:submission).permit(:survey_id, :has_pain, answers_attributes: [])
      end

      def get_submission
        @submission = Submission.includes(:answers).find(params[:id])
      end

    end
  end
end
