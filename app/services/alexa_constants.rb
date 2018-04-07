# frozen_string_literal: true

# All AppConstants
module AlexaConstants
  HELP_RESPONSE = 'Alexa can only process a few seconds of speech at a time, so after each sentence, 
    pause for a breath while your sentence is saved, then continue speaking when you hear the prompt.'
  LAUNCH_RESPONSE = 'What would you like to do? Say tests to list tests. 
    Say start Depression to start a Depression test. Say help for more help.'
  LIST_TEST_RESPONSE = "There are %<count>d tests. Here are the first four: %<list>s. 
    You can ask to list test again, or start a test."
  START_OVER_RESPONSE = 'What would you like to do now?'
  CANCEL_RESPONSE = 'Ok, canceling. What would you like to do now?'
  GOODBYE_RESPONSE = 'Goodbye.'

  TESTNAME_SLOT = 'testname'
  CANNOT_FIND_INSTRUMENT_ERROR = "Cannot find instrument %<instrument>s. Please try again."
end
