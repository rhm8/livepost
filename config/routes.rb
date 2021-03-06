Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'liveposts/create'
  get 'liveposts/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
    end
  end
  
  resources :liveposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
