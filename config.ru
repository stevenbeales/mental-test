# frozen_string_literal: true

require 'rubygems'

require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require 'dotenv'

Dotenv.load(
  File.expand_path("./.#{APP_ENV}.env", __dir__),
  File.expand_path('./.env', __dir__)
)

require './app'
run App.new
