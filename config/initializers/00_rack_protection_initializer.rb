# frozen_string_literal: true

# Protection against Rack hacking attempts
require 'rack/protection'
use Rack::Protection
