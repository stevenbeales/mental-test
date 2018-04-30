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

require 'ralyxa'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra-initializers'
require_relative 'config/db'
require_relative 'app/services/init'
require_relative 'app/models/init'
require_relative 'lib/init'

configure { set :server, :puma }
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :public_folder, File.dirname(__FILE__) + '/public'

# This class is the main entry point to Application.
# Takes an incoming Alexa requests and dispatches
# to a matching intent in intents folder
class App < Sinatra::Base
  enable :sessions

  # Register initializers a la Rails
  register Sinatra::Initializers

  register Sinatra::ActiveRecordExtension

  # Entry point for requests from Amazon Alexa.
  # The incoming requests are dispatched to intents in the intents folder by Ralyxa.
  post '/' do
    begin
      Ralyxa::Skill.handle(request)
    rescue StandardError => exception
      Bugsnag.notify(exception)
    end
  end
end
