Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/auth/instagram', as: :login
  get 'auth/instagram/callback', to: 'sessions#create'
  delete '/logout', as: :logout, to: 'sessions#destroy'
  get '/dashboard', to: 'dashboard#show'
  resources :users, only: [:index]

  get '/remodel', to: 'remodel#show'
  get '/homedecor', to: 'homedecor#show'
end
