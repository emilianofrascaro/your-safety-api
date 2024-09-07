Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'useful_links/index'
      resources :faqs, only: [:index, :show]
      get 'faqs/index'
      get 'faqs/show'
      get 'reservations/index'
      get 'reservations/show'
      post 'reservations/create'
      put 'reservations/update'
      delete 'reservations/destroy'
      resources :useful_links, only: [:index]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  post 'auth/register', to: 'registrations#create'
  post 'auth/login', to: 'authentication#login'
end
