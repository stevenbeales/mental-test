# frozen_string_literal: true

Ralyxa::Skill.intent 'ReadEntry' do
  # TODO
  day = request.slot_value('day')
  AlexaService.read_entry(day: day)
end
