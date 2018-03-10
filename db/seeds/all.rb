# frozen_string_literal: true

require 'json'
require 'oj'
require 'multi_json'
require 'multi_json/adapters/oj'
require './services/instrument_loader'
require './lib/app_constants'

# Load cesd-r if not already loaded
unless Instrument.find_by_name(AppConstants::TEST_INSTRUMENT)
  json_data = File.read('./db/files/cesdr.json')
  json_hash = MultiJson.load(json_data)
  instrument = Instrument.new(name: AppConstants::TEST_INSTRUMENT, content: json_hash)
  InstrumentLoader.instance.load(instrument: instrument, overwrite: true)
end
