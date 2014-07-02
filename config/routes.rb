PainSquadApi::Application.routes.draw do
  require 'api_constraints'

  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      resources :submissions
      resources :favorites, only: [:index, :create, :destroy]

      resource :surveys
      resource :survey_results
      resource :achievements
      resource :activity

      resource :recommendations do
        member { get :prevent; get :manage }
      end

      resource :session
      resources :users
    end
  end

  resource :session, only: [:create, :destroy]

  resources :users, only: [:show, :create, :update, :destroy] do
    get :current, on: :collection
    put :password, on: :member
  end

  # resources :session, only: [:new, :create, :destroy]
  # resources :users

  # get  "signup", to: "users#new",        as: :signup
  # post "login",  to: "sessions#create",  as: :create_session
  # get  "login",  to: "sessions#new",     as: :login
  # get  "logout", to: "sessions#destroy", as: :logout

end