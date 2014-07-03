class Api::V1::ReportsController < ApplicationController

  def show
    # => TODO support multiple reports
    render json: ReportService.new(@user, params[:id]).report_data
  end

end
