# frozen_string_literal: true

require 'dotenv'

# Load environment variables from .env files
# Environment variables for the current environament take precedence
Dotenv.load(
  File.expand_path("./.#{ENV['RACK_ENV']}.env", __dir__),
  File.expand_path('./.env', __dir__)
)
