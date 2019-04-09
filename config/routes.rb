Rails.application.routes.draw do
  resources :roles
  resources :role_permissions
  resources :permissions
  resources :bookings
  resources :shows do
    resources :bookings
  end
  resources :theatres do
    resources :shows
  end
  resources :reviews
  devise_for :users
  resources :movies do
    resources :reviews, except: [:show, :index]
  end

  get '/rbac', to: 'roles#management'
  get '/assign', to: 'assign#users'

  get '/assign/:user_id', to: 'assign#assign'

  post '/assign/:user_id', to: 'assign#assign'

  root to: "movies#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
