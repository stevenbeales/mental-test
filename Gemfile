# frozen_string_literal: true

source 'https://rubygems.org'
ruby ENV['CUSTOM_RUBY_VERSION'] || '2.4.4'

gem 'activerecord', '>= 5.2' # ORM
gem 'activerecord-delay_touching', '>= 1.0' # Batch Touching Calls
gem 'audited', '>= 4.7', require: false # adds table auiting support
gem 'bugsnag', '>= 6.6', require: false # online bug reporting
gem 'bundler-audit', '>= 0.6', require: false # check gems for security issues
gem 'default_value_for', '>= 3.0', require: false # set default values
gem 'discard', '>= 1.0', require: false # soft deletes
gem 'dotenv', '>= 2.2', require: false # adds environment variables from .env files
gem 'goldiloader', '>= 2.1', require: false # automatic eager loading
gem 'i18n', '>= 1.0', require: false # internationalization support
gem 'jsonb_accessor', '>= 1.0', require: false # adds methods to access Jsonb fields
gem 'multi_json', '>= 1.13', require: false # common interface to load json
gem 'nondestructive_migrations', '>= 1.3', require: false # data only migrations
gem 'oj', '>= 3.5', require: false # faster json parsing
gem 'pg', '>= 1.0', platform: :ruby, require: false # for Postgres
gem 'pg_search', '>= 2.1', require: false # Postgres full text search
gem 'puma', '>= 3.11', require: false # puma web server
gem 'rack-heartbeat', '>= 1.1', require: false # provide heartbeat URL
gem 'rack-timeout', '>= 0.4', require: false # configure Rack timeout
gem 'rake', '>= 12.3', require: false # so we can run Rake tasks
gem 'ralyxa', '>= 1.7', require: false # ruby alexa framework
gem 'rest-client', '>= 2.0', platform: :ruby, require: false # minimum version without security vulnerabilities
gem 'secure_headers', '>= 5.0', require: false # secure headers from Twitter
gem 'sinatra', '>= 2.0', require: false # Web server
gem 'sinatra-activerecord', '>= 2.0', require: false # for Active Record models
gem 'sinatra-contrib', '>= 2.0', require: false # hot reloading
gem 'sinatra-initializers', '>= 0.1', require: false # config initializers for sinatra
gem 'sinatra_logger', '>= 0.1', require: false # for logging
gem 'strong_migrations', '>= 0.2', require: false # check migrations for unsafe production operations
gem 'valid_email2', '>= 2.2', require: false # validates email format
gem 'validates_timeliness', '>= 4.0', require: false # validate dates and times
gem 'warning', '>= 0.1', require: false # customize warnings

group :test do
  gem 'coveralls', '>= 0.7', require: false # code coverage
  gem 'database_cleaner', '>=1.6', require: false # for test database cleaning
  gem 'factory_bot', '>= 4.0', require: false # for test data setup
  gem 'fuubar', '>= 2.3', require: false # rspec formatter
  gem 'rack-protection', '>= 2.0', require: false # protect against web attacks
  gem 'rack-test', '>= 1.0', require: false # for testing rake servers
  gem 'rspec', '>= 3.7', require: false # for behavioral driven testing
  gem 'rubocop', '>= 0.5', require: false # syntax checking
  gem 'ruby_audit', '>= 1.2', require: false # complements bundler-audit
  gem 'scrutinizer-ocular', '>= 1.0', require: false # scrutinizer code coverage
  gem 'simplecov', '>= 0.16', require: false # for code coverage
  gem 'simplecov-console', '>= 0.4', require: false # code coverage to console
  gem 'travis', '>= 1.8', require: false # for continuous integrations
end

group :development, :test do
  gem 'annotate', '>= 2.7', require: false # annotate models
  gem 'better_errors', '>= 2.4', require: false # better error logging
  gem 'binding_of_caller', '>= 0.8', require: false # helps better_errors provide more detailed debugging
  gem 'bullet', '>= 5.7', require: false # find slow ActiveRecord queries
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '>= 10.0', platforms: %i[mri mingw x64_mingw]
  gem 'fasterer', '>= 0.4', require: false # find slow code
  gem 'guard', '>= 2.1', require: false # watch for changed files
  gem 'guard-rspec', '>= 4.7', require: false # run rspec on code change
  gem 'overcommit', '>= 0.4', require: false # git hooks
  gem 'reek', '>= 4.8', require: false # find code smells
  gem 'solargraph', '>= 0.2', require: false # ruby editor code completion
  gem 'timecop', '>= 0.9', require: false # testing time dependent
end

group :doc do
  gem 'sdoc', '>= 1.0', require: false # static documentation
end

group :production, :test do
  gem 'rack-ssl', '>= 1.4', require: false # ssl for rack in production
end

group :windows do
  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
  gem 'tzinfo-data', '>= 1', require: false if Gem.win_platform?
  gem 'wdm', '>= 0.1', require: false if Gem.win_platform? # supports Guard watching files on Windows OS.
  gem 'win32console', '>= 1.3 ', require: false if Gem.win_platform? # color code coverage
end
