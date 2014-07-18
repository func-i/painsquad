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
        binding.pry
      end

    end
  end
end
