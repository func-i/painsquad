PainSquadApi::Application.routes.draw do
  require 'api_constraints'

  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      resources :submissions
      resources :favorites, only: [:index, :create, :destroy]
      resources :reports

      resource :surveys do
        member { get 'full'; get 'truncated'; }
      end

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
  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'

  resources :users do
    get :current, on: :collection
    put :password, on: :member
  end

  get :admin, to: 'users#index'

end