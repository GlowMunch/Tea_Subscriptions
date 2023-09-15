Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:create, :show, :update, :destroy] do
        resources :subscriptions, only: [:create, :destroy, :index, :show]
      end
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
