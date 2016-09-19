Rails.application.routes.draw do
  root to: 'welcome#show'

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/dashboard', to: 'users#show', as: 'dashboard'
  delete '/logout', to: 'sessions#destroy', as: :google_logout
  get '/search/index', to: 'search#index'
end
