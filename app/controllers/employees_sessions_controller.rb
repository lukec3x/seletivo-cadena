class EmployeesSessionsController < Devise::SessionsController
  before_action :logout_director, only: [:create]

  private

  def logout_director
    sign_out(:director) if director_signed_in?
  end
end