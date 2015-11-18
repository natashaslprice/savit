Rails.application.routes.draw do
  get 'transactions/show'

  get 'transactions/new'

  get 'transactions/create'

  get 'transactions/edit'

  get 'transactions/udpate'

  get 'transactions/destroy'

  get 'budgets/new'

  get 'budgets/create'

  get 'budgets/edit'

  get 'budgets/update'

  get 'budgets/destroy'

  resources :users, only: [:index, :new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  # root route
  root 'users#index'

  get '/profile', to: 'users#show', as: :profile

  get '/logout', to: 'sessions#destroy', as: :logout

  # get signup route 
  get '/signup', to: 'users#new', as: :signup

  # get login route 
  get '/login', to: 'sessions#new', as: :login


end
