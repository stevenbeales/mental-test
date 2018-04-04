# frozen_string_literal: true

# Require SSL in production
configure :test, :production do
  require 'rack/ssl'
  use Rack::SSL
end 
