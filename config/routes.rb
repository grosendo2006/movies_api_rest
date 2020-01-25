Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :movies, only: [:index]
      resources :seasons, only: [:index]
      resources :movies_and_seasons, only: [:index]
      resources :users do
        resources :purchase, only: [:create, :index]
      end
    end
  end
end
