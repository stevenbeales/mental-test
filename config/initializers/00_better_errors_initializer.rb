# frozen_string_literal: true

require "better_errors"

configure :development, :test do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end
