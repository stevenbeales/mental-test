# frozen_string_literal: true

source 'https://rubygems.org'
ruby ENV['CUSTOM_RUBY_VERSION'] || '2.4.4'

gem 'activerecord', '>= 5.1.5' # ORM
gem 'activerecord-delay_touching', '>= 1.0.1' # Batch Touching Calls
gem 'audited', '>= 4.7.0', require: false # adds table auiting support
gem 'bugsnag', '>= 6.6', require: false # online bug reporting
gem 'bundler-audit', '>= 0.6.0', require: false # check gems for security issues
gem 'discard', '>= 1.0.0', require: false # soft deletes
gem 'dotenv', '>= 2.2.1', require: false # adds environment variables from .env files
gem 'fast_stack', '>= 0.2.0', platform: :ruby, require: false # stack profiler
gem 'flamegraph', '>= 0.9.5', require: false # rack profiling
gem 'i18n', '>= 1.0.0', require: false # internationalization support
gem 'jsonb_accessor', '>= 1.0.0', require: false # adds methods to access Jsonb fields
gem 'memory_profiler', '>= 0.9.10', platform: :ruby, require: false # memory profiler
gem 'multi_json', '>= 1.13.1', require: false # common interface to load json
gem 'oj', '>= 3.5.0', require: false # faster json parsing
gem 'pg', '>= 1.0.0', platform: :ruby, require: false # for Postgres
gem 'pg_search', '>= 2.1.2', require: false # Postgres full text search
gem 'puma', '>= 3.11.2', require: false # puma web server
gem 'rack-contrib', '>= 2.0.1', require: false # browser localization
gem 'rack-heartbeat', '>= 1.1.0', require: false # provide heartbeat URL
gem 'rack-mini-profiler', '>= 1.0.0', require: false # profiling Rack apps
gem 'rack-timeout', '>= 0.4.2', require: false # configure Rack timeout
gem 'rake', '>= 12.3.1', require: false # so we can run Rake tasks
gem 'ralyxa', '>= 1.7.0', require: false # ruby alexa framework
gem 'rest-client', '>= 2.0.2', platform: :ruby, require: false # minimum version without security vulnerabilities 
gem 'route_downcaser', '>= 1.2.1', require: false # case insensitive URLs
gem 'secure_headers', '>= 5.0.5', require: false # secure headers from Twitter
gem 'sinatra', '>= 2.0.1', require: false # Web server
gem 'sinatra-activerecord', '>= 2.0.13', require: false # for Active Record models
gem 'sinatra-contrib', '>= 2.0.1', require: false # hot reloading
gem 'sinatra-initializers', '>= 0.1.4', require: false # config initializers for sinatra
gem 'sinatra_logger', '>= 0.1.0', require: false # for logging
gem 'strong_migrations', '>= 0.2.2', require: false # check migrations for unsafe production operations
gem 'valid_email2', '>= 2.2.2', require: false # validates email format

group :test do
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
  gem 'travis', '>= 1.8.8', require: false # for continuous integrations
  gem 'travis_check_rubies', '>= 0.2.5', require: false # check ruby versions on Travis
end

group :development, :test do
  gem 'annotate', '>= 2.7.2', require: false # annotate models
  gem 'better_errors', '>= 2.4.0', require: false # better error logging 
  gem 'binding_of_caller', '>= 0.8.0', require: false # helps better_errors provide more detailed debugging
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '>= 10.0.2', platforms: %i[mri mingw x64_mingw]
  gem 'fasterer', require: false # find slow code 
  gem 'guard', '>= 2.14.2', require: false # watch for changed files 
  gem 'guard-rspec', '>= 4.7.3', require: false # run rspec on code change
  gem 'overcommit', require: false # git hooks
  gem 'reek', require: false # find code smells
  gem 'ruby-prof', platform: :ruby, require: false
  gem 'timecop', '>= 0.9.1', require: false # testing time dependent
end

group :doc do
  gem 'sdoc', '>= 1.0.0', require: false # static documentation
end

group :production, :test do
  gem 'rack-ssl', '>= 1.4.1', require: false # ssl for rack in production
end

group :windows do
  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
  gem 'tzinfo-data', require: false if Gem.win_platform?
  gem 'wdm', '>= 0.1.0', require: false if Gem.win_platform? # supports Guard watching files on Windows OS.
  gem 'win32console', '>= 1.3.2 ', require: false if Gem.win_platform? # color code coverage
end
