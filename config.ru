# frozen_string_literal: true

require 'rubygems'

require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require 'rack-timeout'

# Call as early as possible so rack-timeout runs before all other middleware.
# Setting service_timeout is recommended. If omitted, defaults to 15 seconds.
use Rack::Timeout, service_timeout: 5

# Secure headers
use SecureHeaders::Middleware

# Compress responses
use Rack::Deflater

require './app'
run App.new
