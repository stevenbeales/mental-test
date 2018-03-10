# frozen_string_literal: true

require 'singleton'
require 'facets'

# Loads instruments 
class InstrumentLoader
  include Singleton
  attr_accessor :instrument
  attr_accessor :response_scale
 
  def load(instrument:, overwrite: false)
    raise AppConstants::LOADER_NIL_INSTRUMENT unless instrument 
    raise AppConstants::LOADER_INSTRUMENT_EXISTS unless overwrite
   
    @instrument = destroy_and_recreate!(instrument) # since overwrite is true
    
    # A json instrument will have its json representation stored in content 
    load!(content: @instrument.content)
    instrument
  end

  protected 
  
  def load!(content: '')
    loader = content.present? ? InstrumentLoaderJson.new : InstrumentLoaderCsv.new
    loader.load!(instrument: @instrument)
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
