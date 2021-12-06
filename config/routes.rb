Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'home#index'
  
  get 'user/profile/:id', to:'users#show', as: 'profile'
  resources :users, only: [:edit, :update]

  resources :projects

  get 'cause/publication/:id', to:'causes#publication', as: 'publication'
  resources :causes do
    resources :comments
  end 

  devise_for :users
end
  