# frozen_string_literal: true

require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './app'
require 'rspec/core/rake_task'
require './models/init'

Dir.glob('lib/tasks/*.rake').each { |r| load r }

RSpec::Core::RakeTask.new

task default: :spec
