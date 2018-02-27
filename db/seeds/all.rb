# frozen_string_literal: true

require 'json'
require 'oj'
require 'multi_json'
require 'multi_json/adapters/oj'
require './models/instrument_loader'

json_data = File.read('./db/cesdr.json')
json_hash = MultiJson.load(json_data)
# Load cesd-r if not already loaded
unless Instrument.find_by_name('Cesd-r')
  instrument = Instrument.new(name: 'Cesd-r', content: json_hash)
  InstrumentLoader.instance.load(instrument: instrument)
end
