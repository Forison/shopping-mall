Rails.application.routes.draw do
  get "goods/index"
  get "goods/new"
  post "goods/new"
  get "goods/:id" ,to: "goods#show"
  # resources :goods
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
