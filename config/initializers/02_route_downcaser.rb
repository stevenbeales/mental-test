# frozen_string_literal: true

require 'route_downcaser'

# case insensitive URLs
use RouteDowncaser::DowncaseRouteMiddleware 
