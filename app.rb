require "sinatra"
require 'sinatra/activerecord'
require './app'
require_relative 'helpers/init'
require_relative 'models/init'
require 'multi_json'
require 'ralyxa'

AlexaVerifier.configure do |config|
  config.enabled            = false # Disables all checks, even though we enable them individually below
  config.verify_uri         = true
  config.verify_timeliness  = true
  config.verify_certificate = false
  config.verify_signature   = false
end


class App < Sinatra::Base

  post '/' do
    Ralyxa::Skill.handle(request)
  end
  
end