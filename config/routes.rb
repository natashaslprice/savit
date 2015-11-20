Rails.application.routes.draw do

  # all routes for users
  resources :users do 
    resources :days
  end
  # sessions routes needs new, create, destroy
  resources :sessions, only: [:new, :create, :destroy]
  # budgets routes need new, create, edit, update, destroy
  resources :budgets, only: [:new, :create, :edit, :update, :destroy]
  # transactions routes need all
  resources :transactions


  # root route
  root 'users#index'

  get '/dashboard', to: 'users#show', as: :dashboard

  # get '/profile', to: 'users#show', as: :profile

  get '/today', to: 'transactions#new', as: :today

  get '/logout', to: 'sessions#destroy', as: :logout

  # get signup route 
  get '/signup', to: 'users#new', as: :signup

  # get login route 
  get '/login', to: 'sessions#new', as: :login

  # get savings route
  get '/savings', to: 'users#savings', as: :savings

  #get spending(transactions) route
  get '/spending', to: 'users#spending', as: :spending

  # post new transaction to user profile
  # post 'transactions/new' => 'users#show'


end
