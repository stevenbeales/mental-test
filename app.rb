# frozen_string_literal: true

# This program is an Alexa skill web service for Mental Health Assessments.  
# It is a Sinatra web application that uses Ralyxa to communicate requests and responses to Amazon.
# It contains functionality to import and manage surveys and instruments.
# It allows an Amazon user to take an assessment by saying "open Mental Health". 
# This web application sits behind the https://github.com/stevenbeales/mental-health Alexa skill 
# 
# Author::    Steven Beales  (mailto:stevenbeales@gmail.com)
# Copyright:: Copyright (c) 2018 Ardint
# License::   MIT

ENV['RACK_ENV'] ||= 'development' 

require 'sinatra'
require 'ralyxa'
require 'bugsnag'
# require 'paper_trail'
# require 'paper_trail-sinatra'

require_relative 'config/db'
require_relative 'services/init'
require_relative 'models/init'

# report errors to bugsnag.com
Bugsnag.configure do |config|
  config.api_key = 'b27cf77d548381f51613fb5c142ae212'
end

set :raise_errors, true
use Bugsnag::Rack
set :show_exceptions, :after_handler

error do
  Bugsnag.notify 'Sorry there was a nasty error - ' + env['sinatra.error'].message
end

AlexaVerifier.configure do |config|
  config.enabled            = false # Disables all checks, even though we enable them individually below
  config.verify_uri         = true
  config.verify_timeliness  = true
  config.verify_certificate = false
  config.verify_signature   = false
end

# This class is the main entry point to Application.
# Takes an incoming Alexa requests and dispatches
# to a matching intent in intents folder
class App < Sinatra::Base
  # TODO: Enable Register PaperTrail when paper_trail gem in 9 and paper_trail-sinatra supports it 
  # to register Paper Trail auditing and version framework
  # register PaperTrail::Sinatra

  log_path = File.join(File.dirname(File.expand_path(__FILE__)), 'log')
  error_logger = File.new(File.join(log_path, 'error.log'), 'a+')
  error_logger.sync = true
 
  before { env['rack.errors'] = error_logger }

  # Entry point for requests from Amazon Alexa. 
  # The incoming requests are dispatched to intents in the intents folder by Ralyxa.
  post '/' do
    Ralyxa::Skill.handle(request)
  end
end
