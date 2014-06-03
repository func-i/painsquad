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

      # TODO: Need to populate advice -> recommendations based upon some
      # requirements specified by SickKids
      # also, speed up this query, it sucks
      def fetch_advice
        @advice = Advice.includes(:recommendations => :steps).first
      end
    end
  end
end
