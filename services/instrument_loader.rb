# frozen_string_literal: true

require './lib/app_constants'
require 'singleton'

# Loads instruments from json  
class InstrumentLoader
  include Singleton
  include AppConstants
  attr_accessor :instrument
  attr_accessor :response_scale
 
  def load(instrument:, overwrite: false)
    raise AppConstants::LOADER_NIL_INSTRUMENT unless instrument 
    raise AppConstants::LOADER_INSTRUMENT_EXISTS unless overwrite
   
    @instrument = destroy_and_recreate!(instrument) # since overwrite is true
    load_json!(name: @instrument.name)
    instrument
  end

  private

  # destroys and returns a new instrument 
  def destroy_and_recreate!(existing)
    cached_name = existing.name
    cached_content = existing.content
    # We must explicitly removed any assessment instruments because these are not destroyed when
    # instrument is deleted
    existing&.assessment_instruments&.destroy
    existing.destroy!
    Instrument.create!(name: cached_name, content: cached_content)
  end

  # Returns an array of Items that represent the questions in an instrument.
  def load_json!(name:)
    elements = []
    @instrument.pages.each { |p| elements += p['elements'] }
    load_response_scale!(elements: elements, name: name)
    load_items!(elements)
  end
  
  def load_response_scale!(elements:, name:)
    @response_scale = ResponseScale.find_or_create_by!(name: name)
    elements.each do |el| 
      el['choices'].map do |ch| 
        choice = load_choice!(ch)
        @response_scale.choices.concat(choice) 
      end 
    end
    @response_scale
  end

  def load_choice!(ch)
    Choice.create_with(description: ch['text']) \
          .find_or_create_by(response_scale: @response_scale, value: ch['value'])
  end

  def load_items!(elements)
    elements.map do |e| 
      item = Item.create!(instrument: @instrument, \
                          name: e['name'], \
                          item_type: e['type'], \
                          is_required: e['isRequired'], \
                          response_scale: @response_scale, \
                          title: e['title'])
      @instrument.items.concat(item)
    end
    @instrument.items
  end
end
