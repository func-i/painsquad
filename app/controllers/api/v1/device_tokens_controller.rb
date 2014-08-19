module Api
  module V1
    class DeviceTokensController < BaseController

      swagger_controller :device_token, 'Device Token Controller'

      swagger_api :update do
        summary 'Saves device token field'
        param :form, :device_token, :string, :required, 'Device Token'
        response :not_found
      end

      def update
        if present_user.update(device_token: params[:device_token])
          head :ok
        else
          render json: nil, status: 404
        end
      end

    end
  end
end
