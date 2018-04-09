# frozen_string_literal: true

require "better_errors"

configure :development, :test do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
  BetterErrors.maximum_variable_inspect_size = 50_000
end
