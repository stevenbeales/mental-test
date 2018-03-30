# frozen_string_literal: true

# Support hot reloading in development
configure :development do
  require 'sinatra/reloader'
  register Sinatra::Reloader
end
