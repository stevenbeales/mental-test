# frozen_string_literal: true

# Class to define Alexa's intent behavior
class AlexaService
  include AlexaConstants

  attr_reader :user

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

  def initialize(user)
    @user = user
  end

  def read_all
    user.journal.list_entries(limit: 4)
  end

  def self.read_entry(day:)
    user.journal.read_entry(day)
  end

  def self.read_last(last_n: 1)
    # TODO
  end
end
