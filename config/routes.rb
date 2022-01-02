Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'home#index'
  
  #users
  get 'user/profile/:id', to:'users#show', as: 'profile'
  resources :users, only: [:edit, :update]

  #introduction for entrepenaures
  get 'user/entrepenaur', to: 'users#entrepenaur', as: 'entrepenaur'

  #project
  resources :projects

  #causes
  get 'cause/publication/:id', to:'causes#publication', as: 'publication'
  resources :causes do
    resources :comments
    resources :donations
  end 

  #sign in with facebook
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
  end

  #rutas para donaciones
  post '/confirmation', to: 'donations#webhook'
  #TODO: https://www.localhost:3000/confirmation -> configurarlo en los webhook de sandobox y producción
  get '/mach/:id', to:'donations#check_donation', as: 'check_donation'#* -> para salir de la vista del qr (la idea es no utilizar esta ruta. Que se actualice solo el modal cuando se realice el pago)
end
  