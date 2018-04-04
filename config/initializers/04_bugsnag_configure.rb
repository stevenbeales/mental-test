# frozen_string_literal: true

set :raise_errors, true
set :show_exceptions, false

# report errors to bugsnag.com
configure do
  require 'bugsnag'
  Bugsnag.configure do |config|
    config.api_key = 'b27cf77d548381f51613fb5c142ae212'
    config.app_version = '1.0'
    config.auto_capture_sessions = true
    config.project_root = '/var/www/mental-test'
    config.send_environment = true
  end
  use Bugsnag::Rack
end
