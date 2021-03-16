Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#user' 

  post '/add_user', to: 'users#add_user'
  get '/game', to: 'users#game'
  post '/attack', to: 'users#attack'
  post '/collect', to: 'users#collect'
  # resources :users, only: [:game]
end
