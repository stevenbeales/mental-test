# frozen_string_literal: true

require 'sinatra'
require_relative 'models/init'
require 'ralyxa'
require_relative 'config/db'

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
  post '/' do
    Ralyxa::Skill.handle(request)
  end
end
