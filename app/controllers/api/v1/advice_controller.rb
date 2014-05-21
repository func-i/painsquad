module Api
  module V1
    class AdviceController < ApplicationController
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

      # TODO: Need to get the advice conditionally based on previous pain report
      def fetch_advice
        @advice = Advice.first
      end
    end
  end
end
