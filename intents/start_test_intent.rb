# frozen_string_literal: true

Ralyxa::Skill.intent 'StartTest' do
  testname = request.slot_value(AlexaService::TESTNAME_SLOT)
  ask(AlexaService.start_test(testname: testname))
end
