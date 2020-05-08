Rails.application.routes.draw do
  root to: 'users#new'
  get '/blogs', to: 'blogs#index' 
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
