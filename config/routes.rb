Rails.application.routes.draw do
  # resources :users, controller: 'employees'
  # resources :users do
  #   post '/login', to: 'authentication#login'
  #   member do
  #     get 'view_leave_request', action: 'view_leave_requests'
  #     patch 'approve_leave_request', action: 'approve_leave_request'
  #   end
  # end
  
  resources :users
  post '/login', to: 'authentication#login'

  # resources :employees do
  #   member do
  #     get 'leave_requests'
  #     post 'create_leave_request'
  #   end
  #   # get '/salaries', to: 'salaries#show'
  #   # post '/salaries', to: 'salaries#create'
  #   resources :salaries, only: [:show, :create]
  #   resource :profile
  #   resources :activities, :leave_balances, shallow: true
  # end

end
