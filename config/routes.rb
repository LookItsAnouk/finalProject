Rails.application.routes.draw do
  root "migranes#index"

  resources :migranes, only: [:new, :destroy, :create]

  resources :users, only: [:new, :create]

  resource :session, only: [:new, :destroy, :create]

  # for version 2 
  # resources :posts do
  #   resources :comments, only: [:create, :destroy]
  # end
end
