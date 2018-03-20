# frozen_string_literal: true

Ralyxa::Skill.intent 'ListTests' do
  respond(AlexaService.list_tests)
end
