Rails.application.routes.draw do
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

  root to: "movies#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
