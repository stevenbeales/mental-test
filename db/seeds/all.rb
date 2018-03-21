# frozen_string_literal: true

require 'json'
require 'oj'
require 'multi_json'
require 'multi_json/adapters/oj'
require './services/instrument_loader'
require './lib/app_constants'

# Load cesd-r if not already loaded
unless Instrument.find_by_name(AppConstants::SEED_INSTRUMENT)
  json_data = File.read('./db/files/cesdr.json')
  json_hash = MultiJson.load(json_data)
  instrument = Instrument.new(name: AppConstants::SEED_INSTRUMENT, content: json_hash)
  InstrumentLoader.instance.load(instrument: instrument, overwrite: true)
end

unless HipaaIdentifier.count == 18 
  HipaaIdentifier.delete_all
  HipaaIdentifier.create! name: 'Name'
  HipaaIdentifier.create! name: 'Fax number'
  HipaaIdentifier.create! name: 'Phone number'
  HipaaIdentifier.create! name: 'E-mail address'
  HipaaIdentifier.create! name: 'Account numbers'
  HipaaIdentifier.create! name: 'Social Security number'
  HipaaIdentifier.create! name: 'Medical Record number'
  HipaaIdentifier.create! name: 'Health Plan number'
  HipaaIdentifier.create! name: 'Certificate/license numbers'
  HipaaIdentifier.create! name: 'URL'
  HipaaIdentifier.create! name: 'IP address'
  HipaaIdentifier.create! name: 'Vehicle identifiers'
  HipaaIdentifier.create! name: 'Device ID'
  HipaaIdentifier.create! name: 'Biometric ID'
  HipaaIdentifier.create! name: 'Full face/identifying photo'
  HipaaIdentifier.create! name: 'Other unique identifying number, characteristic, or code'
  HipaaIdentifier.create! name: 'Postal address (geographic subdivisions smaller than state)'
  HipaaIdentifier.create! name: 'Date precision beyond year'
end
