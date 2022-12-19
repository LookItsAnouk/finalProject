Rails.application.routes.draw do
  root "migraines#index"

  resources :migraines

  resources :users, only: [:new, :create, :edit, :update]

  resource :session, only: [:new, :destroy, :create]

  get '/home', to: 'users#home', as: :home

  # for version 2 
  # resources :posts do
  #   resources :comments, only: [:create, :destroy]
  # end
end
