source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails',       '4.1.0'
gem 'thin',        '~> 1.6.2'
gem 'pg',          '~> 0.17.1'

gem 'rack-cors',   '~> 0.2.9'
gem 'active_model_serializers', '~> 0.8.1'

gem 'sorcery',     '~> 0.8.5'
gem 'pundit',      '~> 0.2.3'

gem 'angularjs-rails'
gem 'ng-rails-csrf', :git => "git://github.com/xrd/ng-rails-csrf.git"

group :production do
  gem 'rails_12factor'
  gem 'sprockets-rails', :require => 'sprockets/railtie'
end


# gem 'sass-rails',   '~> 4.0.3'
# gem 'simple_form',  '~> 3.0.2'
gem 'uglifier',     '~> 2.5.0'
gem 'jquery-rails', '~> 3.1.0'

group :development, :test do
  gem 'rspec-rails',        '~> 2.14.2'
  gem 'cucumber-rails',     '~> 1.4.0', require: false
  gem 'json_spec',          '~> 1.1.1'
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'jazz_hands',         '~> 0.5.2'
end

group :development do
  gem 'foreman',            '~> 0.63.0'
  gem 'spring',             '~> 1.1.2'
  gem 'quiet_assets',       '~> 1.0.2'
  gem 'better_errors',      '~> 1.1.0'
  gem 'binding_of_caller',  '~> 0.7.2'
  gem 'annotate',           '~> 2.6.3'
end

group :test do
  gem 'shoulda-matchers',   '~> 2.6.0'
  gem 'database_cleaner',   '~> 1.2.0'
end
