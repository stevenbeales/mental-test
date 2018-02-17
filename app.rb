require "sinatra"
require 'sinatra/activerecord'
require './app'
require_relative 'helpers/init'
require_relative 'models/init'


class App < Sinatra::Base

  get "/" do
     ""
  end

  enable :method_override
  enable :sessions
  set :session_secret, 'super secret'

  configure do
    set :app_file, __FILE__
  end

  configure :development do
    enable :logging, :dump_errors, :raise_errors
  end

  configure :test do
    enable :logging, :dump_errors, :raise_errors
  end

  configure :production do
    set :raise_errors, false #false will show nicer error page
    set :show_exceptions, false #true will ignore raise_errors and display backtrace in browser
  end
end