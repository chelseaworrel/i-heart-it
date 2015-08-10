Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/auth/instagram', as: :login
  get 'auth/instagram/callback', to: 'sessions#create'
  delete '/logout', as: :logout, to: 'sessions#destroy'

  resources :pictures
  resources :inspirations, only: [:show, :index]
  resources :users, only: [:show, :destroy, :new]
end
