# PainSquad


## Getting Started

### Fast:

`rake db:setup survey:all && foreman start`

### Slow:

#### Server:

- `bundle install`
- `rake db:create`
- `rake db:setup`
- `spring rails server`

#### Client:

- `$ cd public/ng`
- `npm install`
- `bower install`
- `gulp serve`

Using the ios-simulator (be sure to run `sudo npm install -g cordova ios-sim` first)

- `gulp build --ios --run`


## Generating Surveys

`rake survey:all`

` rake survey:full`

`rake survey:truncated`


## Cukes

`gem install cucumber`

Run all: `bundle exec cucumber`

Run specific file: `bundle exec cucumber features/feature_name.feature`

Run specific scenario: `bundle exec cucumber features/feature_name.feature:5`

