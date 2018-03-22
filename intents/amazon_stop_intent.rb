# frozen_string_literal: true

Ralyxa::Skill.intent 'AMAZON.StopIntent' do
  tell(AlexaService.goodbye_response)
end
