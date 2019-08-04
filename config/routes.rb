Rails.application.routes.draw do


  get 'posts/index'
  get 'posts/new'
  post 'posts/new' , to: "posts#create"
  get 'posts/show'
  get 'posts/edit'
  root 'posts#index'
  get '/', to: "posts#index"

  get '/users/new' , to: "users#new"
  post '/users/new' , to: "users#create"

  get 'sessions/new' , to: "sessions#new"
  post 'sessions/new' , to: "sessions#create"
  delete 'sessions/destroy', to: "sessions#destroy"
  delete '/' , to: "sessions#destroy"
  resources :account_activations, only: [:edit]
end
