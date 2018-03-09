# frozen_string_literal: true

source 'https://rubygems.org'
gem 'acts-as-taggable-array-on', '~> 0.4.0' # adds tags
gem 'dotenv', '~> 2.2.1' # adds environment variables from .env files
gem 'kiba', '~> 2.0.0' # ETL
gem 'jsonb_accessor', '~> 1.0.0' # adds methods to access Jsonb fields
gem 'multi_json', '~> 1.13.1' # common interface to load json
gem 'oj', '~> 3.5.0' # faster json parsing
gem 'pg', '~> 1.0.0', platform: :ruby # for Postgres
gem 'puma', '~> 3.11.2' # puma web server
gem 'rack-protection', '~> 2.0.1' # protect against web attacks
gem 'rake', '~> 12.3.0' # so we can run Rake tasks
gem 'ralyxa', '~> 1.6.2' # ruby alexa framework
gem 'sinatra', '~> 2.0.1' # Web server
gem 'sinatra-activerecord', '~> 2.0.13' # for Active Record models

group :test do
  gem 'database_cleaner', '=1.6.1', require: false # for test database cleaning
  gem 'faker', '=1.8.7', require: false # for generating fake test data
  gem 'rack-test', '~> 0.8.3', require: false # for testing rake servers
  gem 'rspec', '~> 3.7.0', require: false # for behavioral driven testing
  gem 'rubocop', '~> 0.53.0', require: false # syntax checking
  gem 'simplecov', '~> 0.15.1', require: false # for code coverage
  gem 'travis', '~> 1.8.8', require: false # for continuous integrations
  gem "factory_bot", "~> 4.0", require: false # for test data setup
  gem 'metric_fu', require: false # metrics dashboard
  gem 'bundler-audit', '~> 0.6.0', require: false # check gems for security issues
end

gem "letter_opener", group: :development # view emails in development

# Added at 2018-03-08 11:26:55 -0500 by steven-surface\steven:
gem "byebug", "~> 10.0", groups: [:development, :test], require: false
