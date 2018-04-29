# frozen_string_literal: true

require 'fileutils'
require './app/app_constants'

set :log_file, settings.root + AppConstants::LOG_FILE
FileUtils.touch(settings.log_file)

configure do
  enable :logging
  file = File.new(settings.log_file, 'a+')
  file.sync = true
  use Rack::CommonLogger, file
end
