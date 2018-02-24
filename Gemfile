# frozen_string_literal: true

source 'https://rubygems.org'
gem 'jsonb_accessor', '~> 1.0.0' # adds methods to access Jsonb fields
gem 'logging' # logging
gem 'multi_json' # common interface to load json
gem 'oj' # faster json parsing
gem 'pg' # for Postgres
gem 'rack-protection' # protect against web attacks
gem 'rake' # so we can run Rake tasks
gem 'ralyxa' # ruby alexa framework
gem 'sinatra' # Web server
gem 'sinatra-activerecord' # for Active Record models

group :development do
  gem 'rerun'
  gem 'rubocop', require: false # checks code quality
  gem 'wdm' # enables rerun to hot load code on Windows
end

group :test do
  gem 'database_cleaner', '=1.6.1'
  gem 'rack-test'
  gem 'rspec'
  gem 'simplecov', require: false
end
