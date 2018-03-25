# frozen_string_literal: true

require 'rubygems'

require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require 'rack/ssl'
use Rack::SSL if Sinatra::Application.production?

require 'dotenv'
Dotenv.load # load environment variables from .env configuration file

# report errors to bugsnag.com
Bugsnag.configure do |config|
  config.api_key = 'b27cf77d548381f51613fb5c142ae212'
  config.app_version = '1.0'
  config.auto_capture_sessions = true
  config.project_root = '/var/www/mental-test'
  config.send_environment = true
end

use Bugsnag::Rack
set :raise_errors, true
set :show_exceptions, false

AlexaVerifier.configure do |config|
  config.enabled            = false # Disables all checks, even though we enable them individually below
  config.verify_uri         = true
  config.verify_timeliness  = true
  config.verify_certificate = false
  config.verify_signature   = false
end

require './app'
run App
