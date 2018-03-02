# frozen_string_literal: true

source 'https://rubygems.org'
gem 'jsonb_accessor', '~> 1.0.0' # adds methods to access Jsonb fields
gem 'logging' # logging
gem 'multi_json' # common interface to load json
gem 'oj' # faster json parsing
gem 'pg' # for Postgres
gem 'puma' # puma web server
gem 'rack-protection' # protect against web attacks
gem 'rake' # so we can run Rake tasks
gem 'ralyxa' # ruby alexa framework
gem 'sinatra' # Web server
gem 'sinatra-activerecord' # for Active Record models

group :development do
  gem 'annotate' # for documenting models rake task 
  gem 'bundler-audit' # check gems for security issues
  gem 'rerun' # for autospec rake task
  gem 'rubocop', require: false # checks code quality
end

group :test do
  gem 'database_cleaner', '=1.6.1' # for test database cleaning
  gem 'faker' # for generating fake test data
  gem 'fuubar' # for formatting rspec
  gem 'rack-test' # for testing rake servers
  gem 'rspec' # for behavioral driven testing
  gem 'simplecov', require: false # for code coverage
end
