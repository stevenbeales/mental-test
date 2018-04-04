# frozen_string_literal: true

require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec # set the default task to spec for Travis CI 
rescue LoadError
  puts 'ignoring rspec in production'
end

Dir.glob('lib/tasks/*.rake').each { |r| load r }

require 'bundler/audit/task'
Bundler::Audit::Task.new
task default: 'bundle:audit' # enable Travis CI to run a check for security vulnerabilities
