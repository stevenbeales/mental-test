# frozen_string_literal: true

Ralyxa::Skill.intent 'StartTest' do
  testname = request.slot_value(AlexaService::DEFAULT_TESTNAME_SLOT)
  respond("I am going to ask you a few questions about #{testname}")
end
