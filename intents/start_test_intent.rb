# frozen_string_literal: true

intent 'StartTest' do
  testname = request.slot_value(AlexaHelper::DEFAULT_TESTNAME_SLOT)
  respond("I am going to ask you a few questions about #{testname}")
end
