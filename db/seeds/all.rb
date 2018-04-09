# frozen_string_literal: true

# Load cesd-r if not already loaded
unless Instrument.find_by_name(AppConstants::DEFAULT_INSTRUMENT)
  instrument = Instrument.new(name: AppConstants::DEFAULT_INSTRUMENT)
  InstrumentLoader.instance.load(instrument: instrument, type: :json)
end

# Load HAM-D if not already loaded
# unless Instrument.find_by_name(AppConstants::DEFAULT_CSV_INSTRUMENT)
# instrument = InstrumentCsv.new(name: AppConstants::DEFAULT_CSV_INSTRUMENT)
# InstrumentLoader.instance.load(instrument: instrument, type: :csv)
# end
