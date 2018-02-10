Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :events

  get    '/events/:id/join',   to: 'events#join', as: 'join'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root 'events#index'

end
