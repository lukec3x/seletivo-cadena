module Api
  module V1
    class ServiceOrdersController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create]
      before_action :authenticate_user_with_token!, only: [:create]

      def create
        service_order = @current_user.service_orders.build(service_order_params)
        service_order.company = @current_user.company

        if service_order.save
          render json: { data: service_order }, status: :created
        else
          render json: { errors: service_order.errors }, status: :unprocessable_entity
        end
      end

      private

      def authenticate_user_with_token!
        token = request.headers['Authorization']
        @current_user = Employee.find_by(authentication_token: token)
    
        unless @current_user
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end

      def service_order_params
        params.require(:service_order).permit(:client_name, :status, :description)
      end
    end
  end
end
