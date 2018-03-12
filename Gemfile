# frozen_string_literal: true

source 'https://rubygems.org'
gem 'acts-as-taggable-array-on', '~> 0.4.0' # adds tags
gem 'dotenv', '~> 2.2.1' # adds environment variables from .env files
gem 'facets', '~> 3.1.0', require: false # additional core methods
gem 'jsonb_accessor', '~> 1.0.0' # adds methods to access Jsonb fields
gem 'kiba', '~> 2.0.0', require: false # ETL
gem 'kiba-common', require: false
gem 'multi_json', '~> 1.13.1' # common interface to load json
gem 'oj', '~> 3.5.0' # faster json parsing
gem 'pg', '~> 1.0.0', platform: :ruby # for Postgres
gem 'puma', '~> 3.11.2', require: false # puma web server
gem 'rack-protection', '~> 2.0.1', require: false # protect against web attacks
gem 'rake', '~> 12.3.0', require: false # so we can run Rake tasks
gem 'ralyxa', '~> 1.6.2' # ruby alexa framework
gem 'sinatra', '~> 2.0.1', require: false # Web server
gem 'sinatra-activerecord', '~> 2.0.13', require: false # for Active Record models
gem 'validates_email_format_of', '~>1.6.3', require: false # validates email format

group :test do
  gem 'bundler-audit', '~> 0.6.0', require: false # check gems for security issues
  gem 'database_cleaner', '=1.6.1', require: false # for test database cleaning
  gem 'factory_bot', '~> 4.0', require: false # for test data setup
  gem 'faker', '=1.8.7', require: false # for generating fake test data
  gem 'metric_fu', require: false # metrics dashboard
  gem 'rack-test', '~> 0.8.3', require: false # for testing rake servers
  gem 'rspec', '~> 3.7.0', require: false # for behavioral driven testing
  gem 'rubocop', '~> 0.53.0', require: false # syntax checking
  gem 'simplecov', '~> 0.15.1', require: false # for code coverage
  gem 'travis', '~> 1.8.8', require: false # for continuous integrations
end

group :development do
  gem 'letter_opener', require: false  # view emails in development
  gem 'guard'
end
# Added at 2018-03-08 11:26:55 -0500 by steven-surface\steven:
gem 'byebug', '~> 10.0', groups: %i[development test], require: false
