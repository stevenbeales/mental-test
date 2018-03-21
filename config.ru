# frozen_string_literal: true

require 'rubygems'

require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require 'rack/ssl'
use Rack::SSL if Sinatra::Application.production?

require 'dotenv'
Dotenv.load # load environment variables from .env configuration file

require './app'
run App
