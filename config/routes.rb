Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"


  resources :organisations, except: %i[destroy] do
    resources :donations, only: %i[create]
  end

  resources :organisations do
    resources :posts, only: %i[index show new create edit update]
  end

  resources :users, only: [:update]
 
  resources :profiles, only: %i[show]
  get '/profile', to: 'profiles#show'
end
