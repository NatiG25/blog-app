Rails.application.routes.draw do
  devise_for :users

  # devise_scope :login do
  #   get '/logins/sign_out' => 'devise/sessions#destroy'
  # end
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
end
