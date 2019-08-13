Rails.application.routes.draw do
  # get 'carts/index'
  # post 'goods' , to: "order#create"
  post '/carts/new' , to: 'carts#create_checkout'
  post '/home/new' , to: 'home#newsletter'
  resources :carts
  resources :goods
  resources :orders
  root "home#index"
  get 'home/index'
  get '/users/new' , to: "users#new"
  post '/users/new' , to: "users#create"

  get 'sessions/new' , to: "sessions#new"
  post 'sessions/new' , to: "sessions#create"
  delete 'sessions/destroy', to: "sessions#destroy"
  delete '/' , to: "sessions#destroy"
  resources :account_activations, only: [:edit]
end
