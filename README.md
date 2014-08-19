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


## Cukes

`gem install cucumber`

Run all: `bundle exec cucumber`

Run specific file: `bundle exec cucumber features/feature_name.feature`

Run specific scenario: `bundle exec cucumber features/feature_name.feature:5`


## Heroku Deployment

- `$ cd public/ng && gulp build`
- Copy all files/folders in `www/` directory to `public/` directory
- Commit and push to `origin:heroku-deployment`
- Finally: `git push heroku heroku-deployment:master`

## API Documentation

To generate the API Documentation:

`rake swagger:docs`

This creates a self-contained directory within `public/` with the generated documentation.