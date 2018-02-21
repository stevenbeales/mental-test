# frozen_string_literal: true

require 'yaml'
require 'active_record'

# set environment to development unless environment already set.
ENV['RACK_ENV'] = 'development' unless %w[development test production].include? ENV['RACK_ENV']

dbconfig = YAML.safe_load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig[ENV['RACK_ENV']]
