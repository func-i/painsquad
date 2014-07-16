module Api
  module V1
    class ReportsController < BaseController

      def show
        render json: ReportService.new(@user, params[:id]).report_data
      end

    end
  end
end
