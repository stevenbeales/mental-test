require 'sinatra'
require_relative 'models/init'
require 'ralyxa'

AlexaVerifier.configure do |config|
  # Disables all checks, even though we enable them individually below
  config.enabled            = false

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
