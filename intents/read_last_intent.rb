# frozen_string_literal: true

Ralyxa::Skill.intent 'ReadLast' do
  # TODO
  last_n = request.slot_value('n')
  AlexaService.read_last(last_n: last_n)
end
