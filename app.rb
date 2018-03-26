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
  # register PaperTrail::Sinatra
  require 'route_downcaser'
  use RouteDowncaser::DowncaseRouteMiddleware # case insensitive URLs

  require 'sinatra_logger'  
  enable :logging
  LOGGER ||= SinatraLogger::Loggers.file_logger('./log/sinatra.log')
  LOGGER ||= SinatraLogger::Loggers.stdout_logger
  use Rack::CommonLogger, LOGGER

  configure :development, :production do
    require 'rack/turnout'
    use Rack::Turnout
    
    # report errors to bugsnag.com
    require 'bugsnag'
    Bugsnag.configure do |config|
      config.api_key = 'b27cf77d548381f51613fb5c142ae212'
      config.app_version = '1.0'
      config.auto_capture_sessions = true
      config.project_root = '/var/www/mental-test'
      config.send_environment = true
    end
    use Bugsnag::Rack
    set :raise_errors, true
    set :show_exceptions, false
  end

  configure :production do
    
    require 'rack/ssl'
    use Rack::SSL

    require 'rack/cache'
    use Rack::Cache
    sha1, date = `git log HEAD~1..HEAD --pretty=format:%h^%ci`.strip.split('^')

    before do
      cache_control :public, :must_revalidate, max_age: 300
      etag sha1
      last_modified date
    end
  end 
 
  AlexaVerifier.configure do |config|
    config.enabled            = false # Disables all checks, even though we enable them individually below
    config.verify_uri         = true
    config.verify_timeliness  = true
    config.verify_certificate = false
    config.verify_signature   = false
  end

  # Entry point for requests from Amazon Alexa. 
  # The incoming requests are dispatched to intents in the intents folder by Ralyxa.
  post '/' do
    Ralyxa::Skill.handle(request)
  end
end
