# frozen_string_literal: true

# Loads instruments from json  
class InstrumentLoader
  attr_accessor :instrument
  attr_accessor :rating_scale
  
  def initialize(instrument)
    @instrument = instrument
    load_json!(name: instrument.name)
    instrument.save!
  end

  # Returns an array of Items that represent the questions in an instrument.
  def load_json!(name:)
    elements = []
    @instrument.pages.each { |p| elements += p['elements'] }
    load_rating_scale!(elements: elements, name: name)
    load_items!(elements)
  end
  
  private

  def load_rating_scale!(elements:, name:)
    @rating_scale = RatingScale.create!(name: name)
    elements.each do |el| 
      el['choices'].map do |ch| 
        choice = load_choice!(ch)
        @rating_scale.choices.concat(choice) 
      end 
    end
    @rating_scale
  end

  def load_choice!(ch)
    Choice.create_with(description: ch['text']) \
          .find_or_create_by(rating_scale: @rating_scale, value: ch['value'])
  end

  def load_items!(elements)
    elements.map do |e| 
      item = Item.create!(instrument: @instrument, \
                          name: e['name'], \
                          item_type: e['type'], \
                          is_required: e['isRequired'], \
                          rating_scale: @rating_scale, \
                          title: e['title'])
      @instrument.items.concat(item)
    end
    @instrument.items
  end
end
