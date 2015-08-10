Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/auth/instagram', as: :login
  get 'auth/instagram/callback', to: 'sessions#create'
  delete '/logout', as: :logout, to: 'sessions#destroy'
  get '/dashboard', to: 'dashboard#show'
  delete '/dashboard', to: 'dashboard#destroy'
  resources :pictures
  get '/create_account', to: 'create_account#show'

  get '/pregnancyfashion', to: 'pregnancyfashion#show'
  get '/kidsparty', to: 'kidsparty#show'
  get '/kidsfashion', to: 'kidsfashion#show'
  get '/kidsfood', to: 'kidsfood#show'
  get '/kidsofinstagram', to: 'kidsofinstagram#show'
  get '/babyshower', to: 'babyshower#show'
  get '/kidsrooms', to: 'kidsrooms#show'
  get '/kidsfurniture', to: 'kidsfurniture#show'
  get '/kidsdecor', to: 'kidsdecor#show'
  get '/inspiration', to: 'inspiration#index'

end
