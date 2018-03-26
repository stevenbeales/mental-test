# frozen_string_literal: true

# Loads instruments from json  
class InstrumentLoaderJson < InstrumentLoader
  attr_accessor :instrument
  attr_accessor :response_scale
 
  # Loads attributes, an array of Items, and rating scale that represent the questions in an instrument.
  def load!(instrument:)
    @instrument = instrument
    load_attributes
    load_elements
    @instrument
  end

  private
 
  def load_attributes
    @instrument.instructions = @instrument.pages[0]['title']
  end

  def load_elements 
    elements = []
    @instrument.pages.each { |p| elements += p['elements'] }
    load_response_scale!(elements: elements, name: instrument.name)
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

  def load_choice!(choice)
    Choice.create_with(description: choice['text']) \
          .find_or_create_by(response_scale: @response_scale, value: choice['value'])
  end

  def load_items!(elements)
    elements.map do |e| 
      item = Item.create!(instrument: @instrument, name: e['name'], \
                          item_type: e['type'], is_required: e['isRequired'], \
                          response_scale: @response_scale, title: e['title'])
      @instrument.items.concat(item)
    end
    @instrument.items
  end
end
