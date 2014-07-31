module Api
  module V1
    class ReportsController < BaseController
      before_action :fetch_report

      swagger_controller :reports, 'Reports Controller'

      swagger_api :show do
        summary 'Returns report'
        param :form, :id, :string, :required, 'Report Identifier'
        response :not_found
      end

      def show
        if @report
          render json: @report
        else
          render json: nil, status: 404
        end
      end

      private

      def fetch_report
        @report = ReportService.new(@user, params[:id]).report_data
      end

    end
  end
end
