Rails.application.routes.draw do
  root to: 'users#new'
  get '/pictures', to: 'pictures#index' 
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
