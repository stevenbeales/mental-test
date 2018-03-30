# frozen_string_literal: true

source 'https://rubygems.org'

gem 'activerecord', '>= 5.1.5' # ORM
gem 'acts-as-taggable-array-on', '>= 0.4.0', require: false # adds tags
gem 'bugsnag', '>= 6.6', require: false # online bug reporting
gem 'dotenv', '>= 2.2.1', require: false # adds environment variables from .env files
gem 'i18n', '>= 0.9.5', require: false # internationalization support
gem 'jsonb_accessor', '>= 1.0.0', require: false # adds methods to access Jsonb fields
gem 'multi_json', '>= 1.13.1', require: false # common interface to load json
gem 'oj', '>= 3.5.0', require: false # faster json parsing
gem 'pg', '>= 1.0.0', platform: :ruby, require: false # for Postgres
gem 'pg_search', '>= 2.1.2', require: false # Postgres full text search
gem 'puma', '>= 3.11.2', require: false # puma web server
gem 'rack-contrib', '>= 2.0.1', require: false # browser localization
gem 'rack-heartbeat', '>= 1.1.0', require: false # provide heartbeat URL
gem 'rake', '>= 12.3.1', require: false # so we can run Rake tasks
gem 'ralyxa', '>= 1.7.0', require: false # ruby alexa framework
gem 'rest-client', '>= 2.0.2', platform: :ruby, require: false # minimum version without security vulnerabilities 
gem 'route_downcaser', '>= 1.2.1', require: false # case insensitive URLs
gem 'sinatra', '>= 2.0.1', require: false # Web server
gem 'sinatra-activerecord', '>= 2.0.13', require: false # for Active Record models
gem 'sinatra-contrib', '>= 2.0.1', require: false # hot reloading
gem 'sinatra-initializers', '>= 0.1.4', require: false # config initializers for sinatra
gem 'sinatra_logger', '>= 0.1.0', require: false # for logging
gem 'turnout', '>= 2.4.1', require: false # for maintenance mode with heartbeat URL
gem 'valid_email2', '>= 2.2.2', require: false # validates email format

group :test do
  gem 'bundler-audit', '>= 0.6.0', require: false # check gems for security issues
  gem 'coveralls', '>= 0.7.1', require: false # code coverage
  gem 'database_cleaner', '=1.6.1', require: false # for test database cleaning
  gem 'factory_bot', '>= 4.0', require: false # for test data setup
  gem 'faker', '>= 1.8.7', require: false # generate random test data
  gem 'fuubar', '>= 2.3.1', require: false # rspec formatter
  gem 'rack-protection', '>= 2.0.1', require: false # protect against web attacks
  gem 'rack-test', '>= 1.0.0', require: false # for testing rake servers
  gem 'rspec', '>= 3.7.0', require: false # for behavioral driven testing
  gem 'rubocop', '>= 0.54.0', require: false # syntax checking
  gem 'ruby_audit', '>= 1.2.0', require: false # complements bundler-audit
  gem 'scrutinizer-ocular', '>= 1.0.1', require: false # scrutinizer code coverage
  gem 'simplecov', '>= 0.16.1', require: false # for code coverage
  gem 'simplecov-console', '>= 0.4.2', require: false # code coverage to console
  gem 'timecop', '>= 0.9.1', require: false # testing time dependent
  gem 'travis', '>= 1.8.8', require: false # for continuous integrations
  gem 'travis_check_rubies', '>= 0.2.5', require: false # check ruby versions on Travis
end

group :development, :test do
  gem 'better_errors', '>= 2.4.0', require: false # better error pages in development
  gem 'guard', '>= 2.14.2', require: false # watch for changed files 
  gem 'guard-rspec', '>= 4.7.3', require: false # run rspec on code change
end

group :doc do
  gem 'sdoc', '>= 1.0.0', require: false # static documentation
end

group :production do
  gem 'rack-ssl', '>= 1.4.1', require: false # ssl for rack in production
end

group :windows do
  gem 'wdm', '>= 0.1.0', require: false if Gem.win_platform? # supports Guard watching files on Windows OS.
  gem 'win32console', '>= 1.3.2 ', require: false if Gem.win_platform? # color code coverage
end
