module Api
  module V1
    class SettingsController < BaseController
      before_action :fetch_alert, only: :update

      def show
        if present_user
          render json: present_user, serializer: AlertsSerializer
        else
          render json: nil, status: 404
        end
      end

      def update
        if present_user && @alert && new_alert?
          present_user.alerts.where(category: alert_type).destroy_all
          present_user.alerts << @alert
          head :ok
        else
          render json: nil, status: 404
        end
      end

      private

      def setting_params
        params.require(:setting).permit(:id, :time, :display_time, :category, :selected)
      end

      def fetch_alert
        @alert = Alert.find(setting_params[:id])
      end

      def new_alert?
        !present_user.alerts.include? @alert
      end

      def alert_type
        setting_params[:category]
      end

    end
  end
end
