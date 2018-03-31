# frozen_string_literal: true

# maintenance support
# enables rake maintenance:start and rake:maintenance:end in production
# puts a file in tmp/mainenance.yml to cause app to go into maintenance mode
configure :production do
  require 'rack/turnout'
  use Rack::Turnout
end
