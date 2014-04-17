PainSquadApi::Application.routes.draw do

  namespace :api, defaults: { format: :json } do
    # resources :cases
    resources :things
  end

  resources :users#,   only: [:show, :create, :update, :destroy]
  resources :session, only: [:create, :destroy]

  resources :things

  root :to => "home#index"

end