# frozen_string_literal: true

Ralyxa::Skill.intent 'ReadEntry' do
  day = request.slot_value('day')
  alexa_service = AlexaService.new(User.authenticate(request.user_id))  
  ask(alexa_service.read_entry(day: day))
end
