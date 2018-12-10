# frozen_string_literal: true

require './lib/csv_source'
require './lib/custom_exceptions'
require './app/app_constants'

# Loads instruments from csv
class InstrumentLoaderCsv < InstrumentLoader
  @folder = AppConstants::INSTRUMENTS_FOLDER
  attr_reader :instrument
  attr_reader :response_scale
  attr_reader :folder

  # Returns an array of Items that represent the questions in an instrument.
  def load_instrument(instrument:)
    @instrument = instrument
    load_content
    load_attributes
    load_response_scale(name: instrument.name)
    load_items
    instrument
  end

  def use_folder(folder: AppConstants::INSTRUMENTS_FOLDER)
    @folder = folder
  end

  private

  def load_content
    filename = "#{folder}#{instrument.name}.csv"
    raise FileNotFoundException.new filename unless File.exist?(filename)
  
    csv_source = CsvSource.new(filename)
    instrument.csv_content = csv_source.to_s
  end

  def load_attributes
    instrument.instrument_type = :csv
    instrument.instructions = ''
  end

  def load_response_scale(name:)
    @response_scale = ResponseScale.find_or_create_by!(name: name)
  end

  def load_choice
    # TODO
  end

  # TODO
  def load_items
    nil
  end
end
