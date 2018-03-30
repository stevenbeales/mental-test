# frozen_string_literal: true

require 'sinatra_logger'   

# Configure Sinatra logging
configure :development, :production do
  enable :logging 
  LOGGER ||= SinatraLogger::Loggers.file_logger(AppConstants::LOG_FILE) 
  LOGGER ||= SinatraLogger::Loggers.stdout_logger 
  use Rack::CommonLogger, LOGGER
end 
