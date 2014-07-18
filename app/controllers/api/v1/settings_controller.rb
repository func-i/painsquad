module Api
  module V1
    class SettingsController < BaseController

      def show
        if present_user
          render json: present_user, serializer: AlertsSerializer
        else
          render json: nil, status: 404
        end
      end

      def update
        if present_user && new_time? && present_user.update(alert_type.to_sym => canonical_time)
          head :ok
        else
          render json: nil, status: 404
        end
      end

      private

      def setting_params
        params.require(:setting).permit(:label, :type, :canonical, :selected)
      end

      def new_time?
        !canonical_time.eql?(present_user.send(alert_type))
      end

      def alert_type
        setting_params[:type]
      end

      def canonical_time
        setting_params[:canonical]
      end

    end
  end
end
