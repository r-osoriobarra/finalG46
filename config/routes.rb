Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'home#index'
  
  resources :users, only: [:edit, :update]
  get 'user/profile/:id', to:'users#show', as: 'profile'

  resources :projects, except: [:index]

  devise_for :users
end
  