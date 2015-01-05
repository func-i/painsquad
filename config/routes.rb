PainSquadApi::Application.routes.draw do
  require 'api_constraints'

  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      resources :users
      resources :submissions
      resources :reports
      resources :favorites, only: [:index, :create, :destroy]
      resource :survey_results
      resource :achievements
      resource :activity
      resource :session

      resource :settings, only: [:show, :update]
      resource :device_token, only: :update

      resource :surveys do
        member { get 'full'; get 'truncated'; }
      end

      resource :recommendations do
        member { get :prevent; get :manage }
      end
    end
  end

  resource :session, only: [:create, :destroy]
  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'

  resources :users do

    collection do
      get :current
    end

    member do 
      put :password
      post :test_message
    end
  end

  resources :questions, only: [:index, :show, :edit, :update]
  resources :choices, only: [:edit, :update]

  resources :reports, only: [:index, :create]

  get :admin, to: 'users#index'

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

end