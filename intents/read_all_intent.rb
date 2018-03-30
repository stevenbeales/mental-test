# frozen_string_literal: true

Ralyxa::Skill.intent 'ReadAll' do 
  alexa_service = AlexaService.new(User.authenticate(request.user_id))  
  ask(alexa_service.read_all)
end
