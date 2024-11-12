module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:login]

      def login
        user = Employee.find_by(email: params[:email])

        if user&.valid_password?(params[:password])
          render json: { authentication_token: user.authentication_token, message: 'Login successful' }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end
    end
  end
end
