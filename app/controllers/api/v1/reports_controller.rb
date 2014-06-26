class Api::V1::ReportsController < ApplicationController

  def index
    # => TODO support multiple reports
    render json: [ReportService.new(@user).report_data], root: false
  end

end
