Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/auth/instagram', as: :login
  get 'auth/instagram/callback', to: 'sessions#create'
  delete '/logout', as: :logout, to: 'sessions#destroy'
  get '/dashboard', to: 'dashboard#show'
  delete '/dashboard', to: 'dashboard#destroy'
  resources :pictures
  resources :inspirations, only: [:show, :index]
  get '/create_account', to: 'create_account#show'
end
