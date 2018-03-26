# frozen_string_literal: true

require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require 'rspec/core/rake_task'
require 'dotenv'
require 'turnout/rake_tasks' # rake maintenance:start, rake maintenance:end

Dotenv.load

Dir.glob('lib/tasks/*.rake').each { |r| load r }

RSpec::Core::RakeTask.new
task default: :spec # set the default task to spec for Travis CI 

require 'bundler/audit/task'
Bundler::Audit::Task.new

task default: 'bundle:audit' # enable Travis CI to run a check for security vulnerabilities
