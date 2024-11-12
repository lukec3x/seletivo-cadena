class DirectorsSessionsController < Devise::SessionsController
  before_action :logout_employee, only: [:create]

  private

  def logout_employee
    sign_out(:employee) if employee_signed_in?
  end
end