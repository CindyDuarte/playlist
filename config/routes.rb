Rails.application.routes.draw do
  devise_for :users
  root to: 'playlists#index'

  resources :playlists
  resources :songs
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
