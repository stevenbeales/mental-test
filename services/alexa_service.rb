# frozen_string_literal: true

# Class to define Alexa's intent behavior
class AlexaService
  DEFAULT_HELP_RESPONSE = <<-HELP
    Alexa can only process a few seconds of speech at a time, so after each sentence, 
    pause for a breath while your sentence is saved, then continue speaking when you hear the prompt.
  HELP

  DEFAULT_TESTNAME_SLOT = 'testname'

  def self.default_help_response
    DEFAULT_HELP_RESPONSE
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
