Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  # devise_for :employees
  devise_for :employees, skip: [:registrations],
             controllers: {
               sessions: "employees_sessions"
             }
  get "/employees/sign_up" => "employees#new", as: "new_employee_registration"
  resources :employees
  
  devise_for :directors, controllers: {
    registrations: "directors",
    sessions: "directors_sessions"
  }

  resources :companies, only: [:new, :create]

  # resources :service_orders, only: [:index, :new, :create]
  resources :service_orders

  resources :dashboard, only: [:index]

  namespace :api do
    namespace :v1 do
      post 'login', to: 'sessions#login'
      post 'service_orders', to: 'service_orders#create'
    end
  end
end
