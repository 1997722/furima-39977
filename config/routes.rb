Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'  
  resources :users, only: [:edit, :update]
  resources :items do
    resources :buys, only: [:index,:create]
  end
end