Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'home#index'
  
  get 'user/profile/:id', to:'users#show', as: 'profile'
  resources :users, only: [:edit, :update]

  #rutas para proyectos
  resources :projects

  #rutas para causas
  get 'cause/publication/:id', to:'causes#publication', as: 'publication'
  resources :causes do
    resources :comments
  end 

  #rutas para inicio de sesión con facebook
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
  end

  #rutas para donaciones
  resources :donations
  post '/confirmation', to: 'donations#webhook'
  #http://www.localhost:3000/confirmation -> configurarlo en los webhook de sandobox y producción
  get '/mach/:id', to:'donations#check_donation', as: 'check_donation'#-> para salir de la vista del qr
end
  