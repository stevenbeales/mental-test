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
require 'sinatra-initializers'

# require 'paper_trail'
# require 'paper_trail-sinatra'
require_relative 'config/db'
require_relative 'app/services/init'
require_relative 'app/models/init'

configure { set :server, :puma }
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :public_folder, File.dirname(__FILE__) + '/public'

# This class is the main entry point to Application.
# Takes an incoming Alexa requests and dispatches
# to a matching intent in intents folder
class App < Sinatra::Base
  # TODO: Enable Register PaperTrail when paper_trail gem in 9 and paper_trail-sinatra supports it 
  # to register Paper Trail auditing and version framework
  # register PaperTrail::
 
  # Register initializers a la Rails 
  register Sinatra::Initializers

  # Entry point for requests from Amazon Alexa. 
  # The incoming requests are dispatched to intents in the intents folder by Ralyxa.
  post '/' do
    Ralyxa::Skill.handle(request)
  end
end
