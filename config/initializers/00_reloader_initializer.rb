# frozen_string_literal: true

configure :development do
  require 'sinatra/reloader'
  register Sinatra::Reloader
end
