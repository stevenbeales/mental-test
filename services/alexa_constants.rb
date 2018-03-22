# frozen_string_literal: true

# All AppConstants
module AlexaConstants
  HELP_RESPONSE = <<-HELP
    Alexa can only process a few seconds of speech at a time, so after each sentence, 
    pause for a breath while your sentence is saved, then continue speaking when you hear the prompt.
  HELP
  LAUNCH_RESPONSE = <<-LAUNCH
    What would you like to do? Say tests to list tests. Say start Depression to start a Depression test. 
    Say help for more help.
  LAUNCH
  LIST_TEST_RESPONSE = <<-LIST
    There are %<count>d tests. Here are the first four: %<list>s. You can ask to list test again, or start a test.
  LIST
  START_OVER_RESPONSE = <<-START
    'What would you like to do?'
  START
  GOODBYE_RESPONSE = 'Goodbye.'

  TESTNAME_SLOT = 'testname'

  CANNOT_FIND_INSTRUMENT_ERROR = <<-ERROR
    Cannot find instrument %<instrument>s. Please try again.
  ERROR
end
