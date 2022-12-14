Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
    resources :users do 
      resources :posts do
        resources :comments
        resources :likes
        end
      end
    end
  end
end
