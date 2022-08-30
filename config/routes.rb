Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :organisations, only: %i[new create edit update] do
    resources :donations, only: :create
  end
  resources :users, only: [:update]
  resources :donations
  resources :profiles, only: %i[show]
  get '/profile', to: 'profiles#show'
end
