# PainSquad


## Getting Started

#### Server:

- `bundle install`
- `rake db:create`
- `rake db:setup`
- `spring rails server`

#### Client:

- `$ cd public/ng`
- `npm install`
- `bower install`
- `sudo npm install -g gulp`
- `gulp serve`


##### Emulation:

Using the ios-simulator - be sure to run `sudo npm install -g cordova ios-sim` first:

- `gulp build --ios --run`

This also works, launches on iPhone 5+ screen height:

- `cordova emulate emulate --target="iPhone (Retina 4-inch)"`


##### Device Testing:

Download the Phonegap Developer app [here](http://app.phonegap.com/), it will not communicate with the server

- `$ cd public/ng`
- `phonegap serve -p 4000`


## Generating Surveys

`rake survey:all`

`rake survey:full`

`rake survey:truncated`

## Generating Advice

`rake advice:all`


## Cukes

`gem install cucumber`

Run all: `bundle exec cucumber`

Run specific file: `bundle exec cucumber features/feature_name.feature`

Run specific scenario: `bundle exec cucumber features/feature_name.feature:5`


## Deployment

* Temporary solution *

- `$ cd public/ng && gulp build`
- Copy all files/folders in `www/` directory to `public/` directory
- Commit and push to `origin:heroku-deployment`
- Finally: `git push heroku heroku-deployment:master`


## Technical Specs

- Rails Version: 4.1.0
- Ruby Version: 2.0.0
- Postgres Version: 9.3.4
- Gems:

```
    gem 'rails',       '4.1.0'
    gem 'thin',        '~> 1.6.2'
    gem 'pg',          '~> 0.17.1'
    gem 'rack-cors',   '~> 0.2.9'
    gem 'active_model_serializers', '~> 0.8.1'
    gem 'sorcery',     '~> 0.8.5'
    gem 'pundit',      '~> 0.2.3'
    gem 'uglifier',     '~> 2.5.0'
    gem 'jquery-rails', '~> 3.1.0'
    gem 'rails_12factor'
    gem 'sprockets-rails', :require => 'sprockets/railtie'
```

- Routes:
```
                     Prefix Verb   URI Pattern                            Controller#Action
            api_submissions GET    /api/submissions(.:format)             api/v1/submissions#index {:format=>:json}
                            POST   /api/submissions(.:format)             api/v1/submissions#create {:format=>:json}
         new_api_submission GET    /api/submissions/new(.:format)         api/v1/submissions#new {:format=>:json}
        edit_api_submission GET    /api/submissions/:id/edit(.:format)    api/v1/submissions#edit {:format=>:json}
             api_submission GET    /api/submissions/:id(.:format)         api/v1/submissions#show {:format=>:json}
                            PATCH  /api/submissions/:id(.:format)         api/v1/submissions#update {:format=>:json}
                            PUT    /api/submissions/:id(.:format)         api/v1/submissions#update {:format=>:json}
                            DELETE /api/submissions/:id(.:format)         api/v1/submissions#destroy {:format=>:json}
              api_favorites GET    /api/favorites(.:format)               api/v1/favorites#index {:format=>:json}
                            POST   /api/favorites(.:format)               api/v1/favorites#create {:format=>:json}
               api_favorite DELETE /api/favorites/:id(.:format)           api/v1/favorites#destroy {:format=>:json}
                api_surveys POST   /api/surveys(.:format)                 api/v1/surveys#create {:format=>:json}
            new_api_surveys GET    /api/surveys/new(.:format)             api/v1/surveys#new {:format=>:json}
           edit_api_surveys GET    /api/surveys/edit(.:format)            api/v1/surveys#edit {:format=>:json}
                            GET    /api/surveys(.:format)                 api/v1/surveys#show {:format=>:json}
                            PATCH  /api/surveys(.:format)                 api/v1/surveys#update {:format=>:json}
                            PUT    /api/surveys(.:format)                 api/v1/surveys#update {:format=>:json}
                            DELETE /api/surveys(.:format)                 api/v1/surveys#destroy {:format=>:json}
           api_achievements POST   /api/achievements(.:format)            api/v1/achievements#create {:format=>:json}
       new_api_achievements GET    /api/achievements/new(.:format)        api/v1/achievements#new {:format=>:json}
      edit_api_achievements GET    /api/achievements/edit(.:format)       api/v1/achievements#edit {:format=>:json}
                            GET    /api/achievements(.:format)            api/v1/achievements#show {:format=>:json}
                            PATCH  /api/achievements(.:format)            api/v1/achievements#update {:format=>:json}
                            PUT    /api/achievements(.:format)            api/v1/achievements#update {:format=>:json}
                            DELETE /api/achievements(.:format)            api/v1/achievements#destroy {:format=>:json}
               api_activity POST   /api/activity(.:format)                api/v1/activities#create {:format=>:json}
           new_api_activity GET    /api/activity/new(.:format)            api/v1/activities#new {:format=>:json}
          edit_api_activity GET    /api/activity/edit(.:format)           api/v1/activities#edit {:format=>:json}
                            GET    /api/activity(.:format)                api/v1/activities#show {:format=>:json}
                            PATCH  /api/activity(.:format)                api/v1/activities#update {:format=>:json}
                            PUT    /api/activity(.:format)                api/v1/activities#update {:format=>:json}
                            DELETE /api/activity(.:format)                api/v1/activities#destroy {:format=>:json}
prevent_api_recommendations GET    /api/recommendations/prevent(.:format) api/v1/recommendations#prevent {:format=>:json}
 manage_api_recommendations GET    /api/recommendations/manage(.:format)  api/v1/recommendations#manage {:format=>:json}
        api_recommendations POST   /api/recommendations(.:format)         api/v1/recommendations#create {:format=>:json}
    new_api_recommendations GET    /api/recommendations/new(.:format)     api/v1/recommendations#new {:format=>:json}
   edit_api_recommendations GET    /api/recommendations/edit(.:format)    api/v1/recommendations#edit {:format=>:json}
                            GET    /api/recommendations(.:format)         api/v1/recommendations#show {:format=>:json}
                            PATCH  /api/recommendations(.:format)         api/v1/recommendations#update {:format=>:json}
                            PUT    /api/recommendations(.:format)         api/v1/recommendations#update {:format=>:json}
                            DELETE /api/recommendations(.:format)         api/v1/recommendations#destroy {:format=>:json}
                api_session POST   /api/session(.:format)                 api/v1/sessions#create {:format=>:json}
            new_api_session GET    /api/session/new(.:format)             api/v1/sessions#new {:format=>:json}
           edit_api_session GET    /api/session/edit(.:format)            api/v1/sessions#edit {:format=>:json}
                            GET    /api/session(.:format)                 api/v1/sessions#show {:format=>:json}
                            PATCH  /api/session(.:format)                 api/v1/sessions#update {:format=>:json}
                            PUT    /api/session(.:format)                 api/v1/sessions#update {:format=>:json}
                            DELETE /api/session(.:format)                 api/v1/sessions#destroy {:format=>:json}
                  api_users GET    /api/users(.:format)                   api/v1/users#index {:format=>:json}
                            POST   /api/users(.:format)                   api/v1/users#create {:format=>:json}
               new_api_user GET    /api/users/new(.:format)               api/v1/users#new {:format=>:json}
              edit_api_user GET    /api/users/:id/edit(.:format)          api/v1/users#edit {:format=>:json}
                   api_user GET    /api/users/:id(.:format)               api/v1/users#show {:format=>:json}
                            PATCH  /api/users/:id(.:format)               api/v1/users#update {:format=>:json}
                            PUT    /api/users/:id(.:format)               api/v1/users#update {:format=>:json}
                            DELETE /api/users/:id(.:format)               api/v1/users#destroy {:format=>:json}
```
