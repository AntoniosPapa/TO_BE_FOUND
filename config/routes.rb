Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :organisations, only: %i[index new create edit update show] do
    resources :donations, only: %i[new create]
  end

  resources :organisations do
    resources :posts, only: %i[index show new create edit update]
  end

  resources :users, only: [:update]
  resources :donations
  resources :profiles, only: %i[show]
  get '/profile', to: 'profiles#show'
end
