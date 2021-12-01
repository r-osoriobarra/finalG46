Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/create'
  get 'users/destroy'
  root 'home#index'
  devise_for :users
end
