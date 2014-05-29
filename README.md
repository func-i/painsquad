# PainSquad


## Getting Started

### Server:

- `bundle install`
- `rake db:create`
- `rake db:setup`
- `spring rails server`

### Client:

- `$ cd public/ng`
- `npm install`
- `bower install`
- `grunt serve`


## Generating Surveys

`rake survey:all`


## Cukes

`gem install cucumber`

Run all: `bundle exec cucumber`

Run specific file: `bundle exec cucumber features/feature_name.feature`

Run specific scenario: `bundle exec cucumber features/feature_name.feature:5`

