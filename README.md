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

Full assessment (incomplete): `rake survey:full`

Truncated assessment (incomplete): `rake survey:truncated`

Test survey with all questions: `rake survey:all`

Test survey with specific question: `rake survey:boolean`

available questions:

- boolean
- slider
- radio
- bodymap
- textbox
- checklist
- checklist_grid
- checklist_extra


## Cukes

`gem install cucumber`

Run all: `bundle exec cucumber`

Run specific file: `bundle exec cucumber features/feature_name.feature`

Run specific scenario: `bundle exec cucumber features/feature_name.feature:5`

