require 'yaml'
require 'active_record'

dbconfig = YAML.load(File.read("config/database.yml"))
ActiveRecord::Base.establish_connection dbconfig[ENV['RACK_ENV']]
