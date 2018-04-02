# frozen_string_literal: true

require 'singleton'

# Singleton template class for loading either CSV or json instruments 
class InstrumentLoader
  include Singleton
  attr_reader :instrument
  attr_reader :response_scale

  
  # load method saves an instrument to DB from either CSV or json
  def load(instrument:, type: :json)
    raise AppConstants::LOADER_NIL_INSTRUMENT unless instrument 
   
    @instrument = instrument
    # A json instrument will have its json representation stored in content 
    load!(type: type)
    instrument
  end

  protected 

  def check_valid_instrument_name
    raise 'Instrument name is missing' if @instrument.name.blank?
  end

  # delegates loading to either Json Loader or CSV Loader
  def load!(type: :json)
    loader = get_loader_instance(type: type)
    loader.load!(instrument: @instrument)
    @instrument.save!
  end
  
  private

  # gets a loader sub-class instance based on type
  def get_loader_instance(type: :json)
    case type
    when :json
      InstrumentLoaderJson.instance 
    when :csv 
      InstrumentLoaderCsv.instance
    else
      raise 'Unknown Instrument Type'
    end
  end
end
