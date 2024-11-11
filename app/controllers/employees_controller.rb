class EmployeesController < ApplicationController
  before_action :authenticate_director!
  
  def new
    @employee = current_director.employees.build
  end
  
  def create
    @employee = current_director.employees.build(employee_params)
    if @employee.save
      redirect_to @employee, notice: "Employee criado com sucesso."
    else
      render :new
    end
  end

  private
  
  def employee_params
    params.require(:employee).permit(:email, :password, :password_confirmation)
  end
end
