module Api
  module V1
    class SubmissionsController < BaseController
      before_action :fetch_submission, only: [:show]

      swagger_controller :reports, 'Submissions Controller'

      swagger_api :create do
        summary "Saves Submission from completed 'Pain Case' Survey"
        param :form, :survey_id, :integer, :required, 'Survey ID'
        param :form, :has_pain, :boolean, :required, 'First Question, indicates if user has experienced pain'
        param :form, :xp_points, :integer, :required, 'User Points Awarded for completing'
        param_list :form, :answers_attributes, :array, :required, 'Answers', [ 'question_id', 'choice_id', 'value', 'bodymap_data', 'custom_text' ]
        response :unprocessable_entity
      end

      def create
        @submission      = Submission.new(submission_params)
        @submission.user = @user
        if @submission.save
          render json: @submission, serializer: ActivitySerializer
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
            bodymap_data: []
          ]
        )
      end

      def fetch_submission
        @submission = Submission.includes(:answers).find(params[:id])
      end

    end
  end
end
