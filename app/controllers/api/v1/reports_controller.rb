class Api::V1::ReportsController < ApplicationController

  def show
    render json: ReportService.new(@user, params[:id]).report_data
  end

end
