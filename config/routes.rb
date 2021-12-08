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

  Rails.application.routes.draw do
    devise_for :users, controllers: {
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
  end
  
end
  