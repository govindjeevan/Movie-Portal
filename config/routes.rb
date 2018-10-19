Rails.application.routes.draw do
  resources :shows
  resources :theatres do
    resources :shows
  end
  resources :reviews
  devise_for :users
  resources :movies do
    resources :reviews, except: [:show, :index]
  end

  root to: "movies#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
