Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#user'

  post '/add_user', to: 'users#add_user'
  post '/game', to: 'users#game'
  post '/attack', to: 'users#attack'
end
