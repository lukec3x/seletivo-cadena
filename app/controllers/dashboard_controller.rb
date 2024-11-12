class DashboardController < ApplicationController
  before_action :authenticate_director!

    def index
      @service_orders = ServiceOrder.includes(:employee).all
      @employees = Employee.includes(:service_orders).all

      if params[:created_at].present?
        @service_orders = @service_orders.where("created_at LIKE ?", "%#{params[:created_at]}%")
      end

      if params[:status].present?
        @service_orders = @service_orders.where(status: params[:status])
      end

      if params[:client_name].present?
        @service_orders = @service_orders.where("client_name LIKE ?", "%#{params[:client_name]}%")
      end
    end
end
