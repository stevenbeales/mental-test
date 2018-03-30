# frozen_string_literal: true

configure :production do
  require 'rack/ssl'
  use Rack::SSL
end 
