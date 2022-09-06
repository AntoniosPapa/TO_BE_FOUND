Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/thankyou', to: 'pages#thankyou'

  resources :users, only: [:update]

  resources :skills, only: %i[index create edit update]

  resources :organisations, except: %i[destroy] do
    resources :donations, only: %i[create]
    resources :posts, only: %i[index show new create edit update]
    resources :needs, only: %i[index create edit update]
  end

  resources :donations, only: %i[show]

  get '/profile', to: 'profiles#show'

  resources :chatrooms, only: :show

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
