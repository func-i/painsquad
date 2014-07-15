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

      resources :reports

      resource :session
      resources :users
    end
  end

  resource :session, only: [:create, :destroy]

  resources :users do
    get :current, on: :collection
    put :password, on: :member
  end

  get :admin, to: 'users#index'

end