module Api
  module V1
    class SubmissionsController < ApplicationController
      before_action :get_submission, only: [:show]
      # skip_before_action :restrict_access

      def show
        render json: @submission
      end

      def create
        binding.pry
        @submission = Submission.create! submission_params
        render json: @submission
      end

      private

      def submission_params
        params.require(:submission).permit!
      end

      def get_submission
        @submission = Submission.includes(:answers).find params[:id]
        # @survey = Survey.includes(questions: [:choices]).find params[:id]
        # @submission = submission.includes(questions: [:choices]).find params[:id]
      end

    end
  end
end
