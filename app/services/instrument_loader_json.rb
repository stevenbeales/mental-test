# frozen_string_literal: true

require 'multi_json'

# Loads instruments from json  
class InstrumentLoaderJson < InstrumentLoader
  attr_reader :instrument
  attr_reader :response_scale
  
  # Loads attributes, an array of Items, and rating scale that represent the questions in an instrument.
  def load_instrument(instrument:)
    @instrument = instrument
    load_content
    load_attributes
    load_elements
    instrument
  end

  private
  
  def load_content
    check_valid_instrument_name 
    filename = "#{AppConstants::INSTRUMENTS_FOLDER}#{instrument.name}.json" 
    raise FileNotFoundException.new filename unless File.exist?(filename)

    json_data = File.read(filename)
    instrument.json_content = MultiJson.load(json_data)
  end

  def load_attributes
    instrument.instrument_type = :json
    instrument.instructions = instrument.pages[0]['title']
  end

  def load_elements
    elements = []
    instrument.pages.each { |page| elements += page['elements'] }
    load_response_scale(elements: elements, name: instrument.name)
    load_items(elements)
  end

  def load_response_scale(elements:, name:)
    @response_scale = ResponseScale.find_or_create_by!(name: name)
    elements.each do |el| 
      el['choices'].map do |ch| 
        choice = Choice.load_choice(response_scale, ch)
        response_scale.choices.concat(choice) 
      end 
    end
    response_scale
  end

  def load_items(elements)
    items = instrument.items
    elements.map do |element| 
      item = Item.create!(instrument: instrument, name: element['name'], \
                          item_type: element['type'], is_required: element['isRequired'], \
                          response_scale: response_scale, title: element['title'])
      items.concat(item)
    end
    items
  end
end
