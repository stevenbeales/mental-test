# frozen_string_literal: true

require 'singleton'
require 'facets/kernel/blank'

# Singleton template class for loading either CSV or json instruments 
class InstrumentLoader
  include Singleton
  attr_accessor :instrument
  attr_accessor :response_scale
 
  # load method saves an instrument to DB from either CSV or json
  def load(instrument:, overwrite: false)
    raise AppConstants::LOADER_NIL_INSTRUMENT unless instrument 
    raise AppConstants::LOADER_INSTRUMENT_EXISTS unless overwrite
   
    @instrument = destroy_and_recreate!(instrument) # since overwrite is true
    
    # A json instrument will have its json representation stored in content 
    load!(content: @instrument.content)
    instrument
  end

  protected 
  
  # delegates loading to either Json Loader or CSV Loader
  def load!(content: '')
    loader = content.present? ? InstrumentLoaderJson.instance : InstrumentLoaderCsv.instance
    loader.load!(instrument: @instrument)
    @instrument.save!
  end

  private
  
  # destroys and returns a new instrument 
  def destroy_and_recreate!(existing)
    cached_name = existing.name
    cached_content = existing.content
    # We must explicitly remove any assessment instruments because these are not destroyed when
    # instrument is deleted
    existing&.assessment_instruments&.destroy
    existing.destroy!
    Instrument.create!(name: cached_name, content: cached_content)
  end
end
