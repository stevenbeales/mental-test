
# frozen_string_literal: true

# Adds /heartbeat route to keep alive route in production 
require 'rack-heartbeat'

# Adds CORS support
Rack::Heartbeat.setup do |config|
  config.heartbeat_response = Base64.decode64('R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==')
  config.heartbeat_headers = { 'Content-Type' => 'image/gif' } 
end
