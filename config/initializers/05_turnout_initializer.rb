# frozen_string_literal: true

configure :development, :production do
  # maintenance support
  require 'rack/turnout'
  use Rack::Turnout
end
