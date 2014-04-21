PainSquadApi::Application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :things
    end
  end

  resources :session, only: [:new, :create, :destroy]
  resources :users
  resources :things

  get  "signup", to: "users#new",        as: :signup
  post "login",  to: "sessions#create",  as: :create_session
  get  "login",  to: "sessions#new",     as: :login
  get  "logout", to: "sessions#destroy", as: :logout
  root :to => "home#index"

end