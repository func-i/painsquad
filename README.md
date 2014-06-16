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
- `BUILD_TARGET=development gulp serve`


##### Emulation:

Using the ios-simulator - be sure to run `sudo npm install -g cordova ios-sim` first:

- `BUILD_TARGET=development gulp build --ios --run`

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


## Cukes

`gem install cucumber`

Run all: `bundle exec cucumber`

Run specific file: `bundle exec cucumber features/feature_name.feature`

Run specific scenario: `bundle exec cucumber features/feature_name.feature:5`


## Deployment


- `$ cd public/ng && BUILD_TARGET=production gulp build`
- Copy all files/folders in `www/` directory to `public/` directory
- Commit and push to `origin:heroku-deployment`
- Finally: `git push heroku heroku-deployment:master`
