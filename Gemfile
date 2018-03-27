# frozen_string_literal: true

source 'https://rubygems.org'

gem 'activerecord', '~> 5.1.5' # ORM
gem 'acts-as-taggable-array-on', '~> 0.4.0', require: false # adds tags
gem 'bugsnag', '~> 6.6', require: false # online bug reporting
gem 'dotenv', '~> 2.2.1', require: false # adds environment variables from .env files
gem 'facets', '~> 3.1.0', require: false # additional core methods
gem 'jsonb_accessor', '~> 1.0.0', require: false # adds methods to access Jsonb fields
gem 'kiba', '~> 2.0.0', require: false # ETL
gem 'mobility', '~> 0.5.1', require: false # translations
gem 'multi_json', '~> 1.13.1', require: false # common interface to load json
gem 'oj', '~> 3.5.0', require: false # faster json parsing
gem 'pg', '~> 1.0.0', platform: :ruby, require: false # for Postgres
gem 'puma', '~> 3.11.2', require: false # puma web server
gem 'rack-cache', '~> 1.7.1', require: false # http caching
gem 'rack-heartbeat', '~> 1.1.0' # provide /heartbeat URL
gem 'rack-protection', '~> 2.0.1', require: false # protect against web attacks
gem 'rack-ssl', '~> 1.4.1', require: false # ssl for rack in production
gem 'rake', '~> 12.3.1', require: false # so we can run Rake tasks
gem 'ralyxa', '~> 1.7.0', require: false # ruby alexa framework
gem 'rest-client', '~> 2.0.2', require: false # minimum version without security vulnerabilities 
gem 'route_downcaser', '~> 1.2.1', require: false # case isnensitive URLs
gem 'sinatra', '~> 2.0.1', require: false # Web server
gem 'sinatra-activerecord', '~> 2.0.13', require: false # for Active Record models
gem 'sinatra_logger', '~> 0.1.0', require: false # for logging
gem 'turnout', '~> 2.4.1', require: false # for maintenance mode
gem 'validates_email_format_of', '~>1.6.3', require: false # validates email format

group :test do
  gem 'bundler-audit', '~> 0.6.0', require: false # check gems for security issues
  gem 'coveralls', '~> 0.7.1', require: false # code coverage
  gem 'database_cleaner', '=1.6.1', require: false # for test database cleaning
  gem 'factory_bot', '~> 4.0', require: false # for test data setup
  gem 'fuubar', '~> 2.3.1', require: false # rspec formatter
  gem 'rack-test', '~> 0.8.3', require: false # for testing rake servers
  gem 'rspec', '~> 3.7.0', require: false # for behavioral driven testing
  gem 'rubocop', '~> 0.54.0', require: false # syntax checking
  gem 'simplecov', '~> 0.16.1', require: false # for code coverage
  gem 'timecop', '~> 0.9.1', require: false # testing time dependent
  gem 'travis', '~> 1.8.8', require: false # for continuous integrations
  gem 'travis_check_rubies', '~> 0.2.5', require: false # check ruby versions on Travis
end

group :development do
  gem 'better_errors', '~> 2.4.0', require: false
  gem 'guard', '~> 2.14.2',  require: false # watch for changed files 
  gem 'guard-rspec', '~> 4.7.3',  require: false # run rspec on change
  gem 'wdm', '>= 0.1.0', require: false if Gem.win_platform? # supports Guard watching files on Windows OS.
end

group :doc do
  gem 'sdoc', '~> 1.0.0', require: false # static documentation
end
