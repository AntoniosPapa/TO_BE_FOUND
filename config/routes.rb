Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :organisations, only: [ :new, :create, :edit, :update, :show, :index ] do
    resources :donations, only: :create
  end
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:update]
  resources :donations
  resources :profiles, only: %i[show]
  # get '/profile', to: 'profiles#show'
end
