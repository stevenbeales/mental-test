# frozen_string_literal: true

require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './app'
require 'rspec/core/rake_task'

Dir.glob('lib/tasks/*.rake').each { |r| load r }

RSpec::Core::RakeTask.new

task default: :spec

require 'bundler/audit/task'
Bundler::Audit::Task.new

task default: 'bundle:audit'
