# frozen_string_literal: true

Ralyxa::Skill.intent 'ReadAll' do
  AlexaService.read_all
end
