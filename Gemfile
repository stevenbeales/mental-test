# frozen_string_literal: true

source 'https://rubygems.org'

gem 'activerecord', '~> 5.1.5' # ORM
gem 'acts-as-taggable-array-on', '~> 0.4.0' # adds tags
gem 'dotenv', '~> 2.2.1' # adds environment variables from .env files
gem 'facets', '~> 3.1.0', require: false # additional core methods
gem 'jsonb_accessor', '~> 1.0.0' # adds methods to access Jsonb fields
gem 'kiba', '~> 2.0.0', require: false # ETL
gem 'multi_json', '~> 1.13.1' # common interface to load json
gem 'oj', '~> 3.5.0' # faster json parsing
gem 'pg', '~> 1.0.0', platform: :ruby # for Postgres
gem 'puma', '~> 3.11.2', require: false # puma web server
gem 'rack-protection', '~> 2.0.1', require: false # protect against web attacks
gem 'rake', '~> 12.3.1', require: false # so we can run Rake tasks
gem 'ralyxa', '~> 1.7.0' # ruby alexa framework
gem 'sinatra', '~> 2.0.1', require: false # Web server
gem 'sinatra-activerecord', '~> 2.0.13', require: false # for Active Record models
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
  gem 'guard', '~> 2.14.2',  require: false # watch for changed files 
  gem 'guard-rspec', '~> 4.7.3',  require: false # run rspec on change
  gem 'wdm', '>= 0.1.0' if Gem.win_platform? # supports Guard watching files on Windows OS.
end

group :doc do
  gem 'sdoc', '~> 1.0.0', require: false # static documentation
end

gem 'bugsnag', '~> 6.6' # online bug reporting 
gem 'mobility', '~> 0.5.1' # translations
gem 'rest-client', '~> 2.0.2' # minimum version without security vulnerabilities 
