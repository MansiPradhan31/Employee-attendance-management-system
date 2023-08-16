Rails.application.routes.draw do
  resources :users do
    resources :employees,shallow: true do
    end
  end
  resources :employees do
    member do
      get 'leave_requests'
      post 'create_leave_request'
    end
    get '/salaries', to: 'salaries#show'
    post '/salaries', to: 'salaries#create'
    resource :profile, shallow: true
    resources :activities, :leave_balances, shallow: true
  end
end
