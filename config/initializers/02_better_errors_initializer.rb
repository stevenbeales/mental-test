# frozen_string_literal: true

configure :development, :test do
  require 'better_errors'
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
  BetterErrors.maximum_variable_inspect_size = 50_000
end
