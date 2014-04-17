PainSquadApi::Application.routes.draw do

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :things

  namespace :api, defaults: { format: :json } do
    # resources :cases
    resources :things
  end

end