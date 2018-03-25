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
require 'sinatra_logger'
require 'sinatra/kittens'
# require 'paper_trail'
# require 'paper_trail-sinatra'
require_relative 'config/db'
require_relative 'services/init'
require_relative 'models/init'

LOGGER ||= SinatraLogger::Loggers.file_logger('./log/sinatra.log')
LOGGER ||= SinatraLogger::Loggers.stdout_logger

# This class is the main entry point to Application.
# Takes an incoming Alexa requests and dispatches
# to a matching intent in intents folder
class App < Sinatra::Base
  # TODO: Enable Register PaperTrail when paper_trail gem in 9 and paper_trail-sinatra supports it 
  # to register Paper Trail auditing and version framework
  # register PaperTrail::Sinatra
  configure :development, :production do
    enable :logging
    use Rack::CommonLogger, LOGGER
  end
  
  configure do
    register Sinatra::Kittens
  end
  # Entry point for requests from Amazon Alexa. 
  # The incoming requests are dispatched to intents in the intents folder by Ralyxa.
  post '/' do
    Ralyxa::Skill.handle(request)
  end
end
