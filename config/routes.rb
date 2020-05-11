Rails.application.routes.draw do
  root to: 'users#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :favorites, only: [:create, :destroy]
  get '/users/:id/favorites', to: 'users#favorites'
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
