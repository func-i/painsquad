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


## Best Practices

lints coffeescript:

`$ coffeelint public/ng/app/scripts/**/*.coffee`


rails security audit:

`$ brakema app/`


ruby static code analysis:

`$ rubocop app/`


ruby codesmell:

`$ reek app/`
