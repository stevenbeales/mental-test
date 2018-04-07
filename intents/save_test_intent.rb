# frozen_string_literal: true

Ralyxa::Skill.intent 'SaveTest' do
  respond("Save Test #{request.slot_value('testname')}")
  # TODO: Implement save test
end
