# frozen_string_literal: true

require 'yaml'
require 'active_record'

dbconfig = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection dbconfig[ENV['RACK_ENV']]
