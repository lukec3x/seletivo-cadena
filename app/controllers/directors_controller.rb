# frozen_string_literal: true
  class DirectorsController < Devise::RegistrationsController
    private

    def sign_up_params
      params.require(:director).permit(:email, :password, :password_confirmation, :name, :cpf)
    end

    def after_sign_up_path_for(resource)
      new_company_path
    end
  end