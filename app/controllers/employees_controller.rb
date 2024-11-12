class EmployeesController < ApplicationController
  before_action :authenticate_director!
  
  def new
    if current_director.companies.first.nil?
      current_director.companies.create
    end

    @employee = current_director.companies.first.employees.build
  end
  
  def create
    @employee = current_director.companies.first.employees.build(employee_params)
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
