# frozen_string_literal: true

require 'sinatra'
require 'ralyxa'
# require 'paper_trail'
# require 'paper_trail-sinatra'

require_relative 'config/db'
require_relative 'models/init'

APP_NAME = 'Mental Health'

AlexaVerifier.configure do |config|
  # Disables all checks, even though we enable them individually below
  config.enabled            = false

  config.verify_uri         = true
  config.verify_timeliness  = true
  config.verify_certificate = false
  config.verify_signature   = false
end

# Main entry point to Application.
# Takes an incoming Alexa requests and dispatches
# to a matching intent in intents folder
class App < Sinatra::Base
  # TODO: Enable Register PaperTrail when paper_trail gem in 9 and paper_trail-sinatra supports it 
  # to register Paper Trail auditing and version framework
  # register PaperTrail::Sinatra

  # Alexa ruby framework dispatches request to intents
  post '/' do
    Ralyxa::Skill.handle(request)
  end
end
