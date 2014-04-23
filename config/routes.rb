require 'api_constraints'
PainSquadApi::Application.routes.draw do

  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      resource :surveys
    end
  end

  resources :session, only: [:new, :create, :destroy]
  resources :users
  resources :surveys

  get  "signup", to: "users#new",        as: :signup
  post "login",  to: "sessions#create",  as: :create_session
  get  "login",  to: "sessions#new",     as: :login
  get  "logout", to: "sessions#destroy", as: :logout
  root :to => "home#index"

end