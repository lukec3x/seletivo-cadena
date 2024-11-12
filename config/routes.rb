Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  # devise_for :employees
  devise_for :employees, skip: [:registrations]
  get "/employees/sign_up" => "employees#new", as: "new_employee_registration"
  resources :employees
  
  devise_for :directors, controllers: {
    registrations: "directors"
  }

  resources :companies, only: [:new, :create]
end
