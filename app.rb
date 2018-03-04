# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development' 

require 'sinatra'
require 'ralyxa'
require 'fileutils'

# require 'paper_trail'
# require 'paper_trail-sinatra'

set :root, File.dirname(__FILE__)
set :app_file, __FILE__

require_relative 'lib/app_constants'
require_relative 'config/db'
require_relative 'services/init'
require_relative 'models/init'

AlexaVerifier.configure do |config|
  config.enabled            = false # Disables all checks, even though we enable them individually below
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
  log_path = File.join(File.dirname(File.expand_path(__FILE__)), 'log')
  error_logger = File.new(File.join(log_path, 'error.log'), 'a+')
  error_logger.sync = true
 
  before { env['rack.errors'] = error_logger }

  post '/' do
    Ralyxa::Skill.handle(request)
  end
end
