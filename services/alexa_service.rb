# frozen_string_literal: true

# Class to define Alexa's intent behavior
class AlexaService
  include AlexaConstants
  
  def self.help_response
    HELP_RESPONSE
  end

  def self.list_tests
    Instrument.list_tests
  end

  def self.read_all
    # TODO
  end

  def self.read_entry(day:)
    # TODO
  end

  def self.read_last(last_n: 1)
    # TODO
  end
end
