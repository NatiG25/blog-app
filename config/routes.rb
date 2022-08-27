Rails.application.routes.draw do
  resources :users, only: [:index, :show, :new] do
    resources :posts, only: [:index, :show, :new] do
      resources :comments
    end
  end
  root "users#index"
end
