# frozen_string_literal: true

require 'singleton'

# Singleton template class for loading either CSV or json instruments 
class InstrumentLoader
  include Singleton
  attr_reader :instrument
   
  # load method saves an instrument to DB from either CSV or json
  def load(instrument:, type: :json)
    raise I18n.t :loader_nil_instrument unless instrument 
   
    @instrument = instrument
    # A json instrument will have its json representation stored in content 
    load!(type: type)
    instrument
  end

  protected 

  def check_valid_instrument_name
    raise I18n.t :instrument_name_missing if instrument.name.blank?
  end

  # delegates loading to either Json Loader or CSV Loader
  def load!(type: :json)
    loader = get_loader_instance(type: type)
    loader.load_instrument(instrument: instrument)
    instrument.save!
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
      raise I18n.t :unknown_instrument_type
    end
  end
end
