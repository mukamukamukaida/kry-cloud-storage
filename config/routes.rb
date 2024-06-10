Rails.application.routes.draw do
  root 'folders#index'
  
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :folders do
    resources :stored_files, only: [:create, :destroy]
  end

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end