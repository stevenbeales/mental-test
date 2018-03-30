# frozen_string_literal: true

require 'route_downcaser'
use RouteDowncaser::DowncaseRouteMiddleware # case insensitive URLs
