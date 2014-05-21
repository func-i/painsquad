module Api
  module V1
    class AdvicesController < ApplicationController
      # skip_before_action :restrict_access
      before_action :fetch_advice

      def show
        if @advice
          render json: @advice
        else
          render json: nil, status: 404
        end
      end

      private

      # TODO: Need to populate advice -> recommendations based upon some requirements
      def fetch_advice
        @advice = Advice.last
      end
    end
  end
end
