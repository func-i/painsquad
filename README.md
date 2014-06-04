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
- `grunt serve`


## Generating Surveys

`rake survey:all`

` rake survey:full`

`rake survey:truncated`


## Cukes

`gem install cucumber`

Run all: `bundle exec cucumber`

Run specific file: `bundle exec cucumber features/feature_name.feature`

Run specific scenario: `bundle exec cucumber features/feature_name.feature:5`

