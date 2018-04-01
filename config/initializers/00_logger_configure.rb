# frozen_string_literal: true

require 'sinatra_logger'
require 'fileutils'
require './app/app_constants'

set :log_file, settings.root + AppConstants::LOG_FILE
FileUtils.touch(settings.log_file)

# Configure Sinatra logging
enable :logging 
LOGGER ||= SinatraLogger::Loggers.file_logger(settings.log_file) 
LOGGER ||= SinatraLogger::Loggers.stdout_logger 
use Rack::CommonLogger, LOGGER
