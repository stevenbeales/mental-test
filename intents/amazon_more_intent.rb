# frozen_string_literal: true

Ralyxa::Skill.intent 'AMAZON.MoreIntent' do
  respond AlexaService.default_help_response
end
