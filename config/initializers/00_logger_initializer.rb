# frozen_string_literal: true

require 'sinatra_logger'   

enable :logging 
LOGGER ||= SinatraLogger::Loggers.file_logger('./log/sinatra.log') 
LOGGER ||= SinatraLogger::Loggers.stdout_logger 
use Rack::CommonLogger, LOGGER 
