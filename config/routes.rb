Rails.application.routes.draw do
  
  # all routes for users
  resources :users 
  # sessions routes needs new, create, destroy
  resources :sessions, only: [:new, :create, :destroy]
  # budgets routes need new, create, edit, update, destroy
  resources :budgets, only: [:new, :create, :edit, :update, :destroy]
  # transactions routes need all
  resources :transactions

  # root route
  root 'users#index'

  get '/profile', to: 'users#show', as: :profile

  get '/logout', to: 'sessions#destroy', as: :logout

  # get signup route 
  get '/signup', to: 'users#new', as: :signup

  # get login route 
  get '/login', to: 'sessions#new', as: :login


end
