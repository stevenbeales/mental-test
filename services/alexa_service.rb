# frozen_string_literal: true

# Class to define Alexa's intent behavior
class AlexaService
  include AlexaConstants

  def self.goodbye_response
    GOODBYE_RESPONSE
  end
  
  def self.help_response
    HELP_RESPONSE
  end

  def self.launch_response
    LAUNCH_RESPONSE
  end
  
  def self.start_over_response
    START_OVER_RESPONSE
  end

  def self.list_tests
    format(LIST_TEST_RESPONSE, count: Instrument.count, list: Instrument.list_tests(limit: 4))
  end

  def self.start_test(testname: AppConstants::DEFAULT_INSTRUMENT)
    instrument = Instrument.find_by(name: testname)
    return format(AlexaConstants::CANNOT_FIND_INSTRUMENT_ERROR, instrument: testname) unless instrument
    instrument.instructions
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
