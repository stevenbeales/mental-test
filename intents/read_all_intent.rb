# frozen_string_literal: true

Ralyxa::Skill.intent 'ReadAll' do
  user = User.authenticate(request.user_id)
  alexa_service = AlexaService.new(user)  
  ask(alexa_service.read_all)
end
