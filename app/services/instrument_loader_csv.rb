# frozen_string_literal: true

require './lib/csv_source'
require './lib/rename_field'
require './lib/verify_fields_presence'

# Loads instruments from csv  
class InstrumentLoaderCsv < InstrumentLoader
  attr_accessor :instrument
  attr_accessor :response_scale
 
  # Returns an array of Items that represent the questions in an instrument.
  def load!(instrument:)
    @instrument = instrument
    load_content!
    load_attributes!
    load_response_scale!
    load_items!
  end

  private

  def load_content!
    @csv_source = CsvSource.new("#{AppConstants::INSTRUMENTS_FOLDER}#{@instrument.name}.csv", {})
    @instrument.csv_content = @csv_source.to_s
  end

  def load_attributes!
    @instrument.instrument_type = :csv
    @instrument.instructions = ''
  end
  
  def load_response_scale!(name:)
    @response_scale = ResponseScale.find_or_create_by!(name: name)
  end

  def load_choice!
    # TODO
  end

  # TODO
  def load_items!
    nil
  end
end
