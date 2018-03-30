# frozen_string_literal: true

require 'sinatra_logger'   
require 'fileutils'

FileUtils.touch(AppConstants::LOG_FILE)

enable :logging 
LOGGER ||= SinatraLogger::Loggers.file_logger(AppConstants::LOG_FILE) 
LOGGER ||= SinatraLogger::Loggers.stdout_logger 
use Rack::CommonLogger, LOGGER 
