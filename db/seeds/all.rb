require 'json'
require 'oj'
require 'multi_json'
require 'multi_json/adapters/oj'

json_data = File.read('./db/cesdr.json')
json_hash = MultiJson.load(json_data)
Instrument.create!(:name => 'Cesd-r', :content => json_hash)