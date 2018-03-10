# frozen_string_literal: true

# Loads instruments from csv  
class InstrumentLoaderCsv
  attr_accessor :instrument
  attr_accessor :response_scale
 
  # Returns an array of Items that represent the questions in an instrument.
  def load!(instrument:)
    @instrument = instrument
    load_response_scale!
    load_items!
  end

  private
  
  def load_response_scale!(name:)
    @response_scale = ResponseScale.find_or_create_by!(name: name)
  end

  def load_choice!(choice)
    Choice.create_with(description: choice['text']) \
          .find_or_create_by(response_scale: @response_scale, value: choice['value'])
  end

  # TODO
  def load_items!
    nil
  end
end
