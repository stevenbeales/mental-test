# frozen_string_literal: true

# Class to define Alexa's intent behavior
class AlexaService
  include AlexaConstants

  attr_reader :user

  def self.goodbye_response
    I18n.t :goodbye_response
  end
  
  def self.help_response
    I18n.t :help_response
  end

  def self.launch_response
    I18n.t :launch_response
  end
  
  def self.start_over_response
    I18n.t :start_over_response 
  end
  
  def self.cancel_response
    I18n.t :cancel_response
  end

  def self.list_tests
    format(I18n.t(:list_test_response), count: Instrument.count, list: Instrument.list_tests(limit: 4))
  end

  def self.start_test(testname: AppConstants::DEFAULT_INSTRUMENT)
    instrument = Instrument.find_by(name: testname)
    return format(I18n.t(:cannot_find_instrument), instrument: testname) unless instrument
    instrument.first_question_and_instructions
  end

  def initialize(user)
    @user = user
  end

  def read_all
    user.journal.list_entries(limit: 4)
  end

  def read_entry(day: Date.today)
    user.journal.read_entry(day: day)
  end

  def read_last(last_n: 1)
    user.journal.read_last(last_n: last_n)
  end
end
