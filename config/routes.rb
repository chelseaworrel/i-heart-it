Rails.application.routes.draw do
  root to: 'welcome#show'

  get '/auth/instagram', as: :login
  get 'auth/instagram/callback', to: 'sessions#create'
  delete '/logout', as: :logout, to: 'sessions#destroy'

  mount Attachinary::Engine => "/attachinary"

  resources :pictures
  resources :inspirations, only: [:show, :index]
  resources :users

end
