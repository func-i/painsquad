PainSquadApi::Application.routes.draw do

  namespace :api, defaults: { format: :json } do
    # resources :cases
    resources :things
  end

  resources :users
  resources :session, only: [:new, :create, :destroy]

  resources :things

  get  "signup", to: "users#new",        as: :signup
  post "login",  to: "sessions#create",  as: :create_session
  get  "login",  to: "sessions#new",     as: :login
  get  "logout", to: "sessions#destroy", as: :logout
  root :to => "home#index"

end