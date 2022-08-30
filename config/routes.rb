Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # resources :profiles, only: %i[show edit update]
  get '/profile', to: 'profiles#show'
  # get '/profile/edit', to: 'profiles#edit'
end
