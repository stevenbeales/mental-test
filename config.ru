# frozen_string_literal: true

require 'rubygems'

require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require 'rack/protection'
use Rack::Protection

require 'dotenv'
Dotenv.load # load environment variables from .env configuration file

require './app'
run App.new
