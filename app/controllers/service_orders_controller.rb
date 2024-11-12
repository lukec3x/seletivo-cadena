class ServiceOrdersController < ApplicationController
  before_action :authenticate_employee!

  def index
    @service_orders = current_employee.company.service_orders
  end

  def new
    @service_order = current_employee.service_orders.build
  end

  def create
    @service_order = current_employee.service_orders.build(service_order_params)
    @service_order.company = current_employee.company
    if @service_order.save
      redirect_to service_orders_path, notice: "Ordem de serviço criada com sucesso."
    else
      render :new
    end
  end

  # def destroy
  #   @service_order = ServiceOrder.find(params[:id])
  #   @service_order.destroy
  #   redirect_to service_orders_path, notice: "Pedido de serviço excluído com sucesso!"
  # end

  private

  def service_order_params
    params.require(:service_order).permit(:client_name, :status, :description)
  end
end
