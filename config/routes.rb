Rails.application.routes.draw do
  resources :products do
    collection do
      get :search
      get :minor
      get :major
      get :top_selling
      get :recent
      get :by_price_range
      get :cheap_first
      get :expensive_first
      get :today
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
