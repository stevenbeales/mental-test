# frozen_string_literal: true

Ralyxa::Skill.intent 'ListTests' do
  ask(AlexaService.list_tests)
end
