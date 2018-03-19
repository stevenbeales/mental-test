# frozen_string_literal: true

intent 'ReadEntry' do
  # TODO
  day = request.slot_value('day')
  AlexaService.read_entry(day: day)
end
