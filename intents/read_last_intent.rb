# frozen_string_literal: true

Ralyxa::Skill.intent 'ReadLast' do
  last_n = request.slot_value('n')
  alexa_service = AlexaService.new(User.authenticate(request.user_id))  
  ask(alexa_service.read_last(last_n: last_n))
end
