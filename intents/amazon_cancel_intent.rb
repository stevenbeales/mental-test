# frozen_string_literal: true

Ralyxa::Skill.intent 'AMAZON.CancelIntent' do
  respond AlexaService.cancel_response
end
