# frozen_string_literal: true

source 'https://rubygems.org'
gem 'acts-as-taggable-array-on'
gem 'dotenv' # adds environment variables from .env files
gem 'jsonb_accessor', '~> 1.0.0' # adds methods to access Jsonb fields
gem 'multi_json' # common interface to load json
gem 'oj' # faster json parsing
gem 'pg', platform: :ruby # for Postgres
gem 'puma' # puma web server
gem 'rack-protection' # protect against web attacks
gem 'rake' # so we can run Rake tasks
gem 'ralyxa' # ruby alexa framework
gem 'sinatra' # Web server
gem 'sinatra-activerecord' # for Active Record models

group :development do
  gem 'bundler-audit' # check gems for security issues
end

group :test do
  gem 'database_cleaner', '=1.6.1' # for test database cleaning
  gem 'faker' # for generating fake test data
  gem 'rack-test' # for testing rake servers
  gem 'rspec' # for behavioral driven testing
  gem 'simplecov', require: false # for code coverage
end
