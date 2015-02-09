class ReportsController < AdminController

	def create
		report = AdminReportingService.new(params[:report])
		send_data report.generate, filename: "#{Time.now.to_i}_#{report.from_date}_#{report.to_date}.csv"
	end

end