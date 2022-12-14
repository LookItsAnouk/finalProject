Rails.application.routes.draw do
  root "migranes#index"

  resources :migranes

  resources :users, only: [:new, :create, :edit, :update]

  resource :session, only: [:new, :destroy, :create]


  # for version 2 
  # resources :posts do
  #   resources :comments, only: [:create, :destroy]
  # end
end
