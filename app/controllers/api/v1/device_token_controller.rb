module Api
  module V1
    class DeviceTokenController < BaseController

      swagger_controller :device_token, 'Device Token Controller'

      # swagger_api :show do
      #   summary 'Returns report'
      #   param :form, :id, :string, :required, 'Report Identifier'
      #   response :not_found
      # end

      def update
        binding.pry
      end

      private

    end
  end
end
