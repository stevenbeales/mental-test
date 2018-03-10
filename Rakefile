# frozen_string_literal: true

require 'rubygems'

require 'bundler'
Bundler.require(:test)

require './app'
require 'rspec/core/rake_task'

Dir.glob('lib/tasks/*.rake').each { |r| load r }

RSpec::Core::RakeTask.new

task default: :spec

require 'dotenv'
Dotenv.load

require 'bundler/audit/task'
Bundler::Audit::Task.new

task default: 'bundle:audit'
