Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :organisations, only: [ :index, :new, :create, :edit, :update, :show ] do

    resources :donations, only: [ :new, :create]

  end

  resources :users, only: [:update]

  resources :skills_offers, only: %i[new create edit update]


  resources :donations

  resources :profiles, only: %i[show]

  get '/profile', to: 'profiles#show'
end
