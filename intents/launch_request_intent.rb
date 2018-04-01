# frozen_string_literal: true

Ralyxa::Skill.intent 'LaunchRequest' do
  ask(AlexaService.launch_response)
end
