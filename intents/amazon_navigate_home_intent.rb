# frozen_string_literal: true

Ralyxa::Skill.intent 'AMAZON.NavigateHomeIntent' do
  ask(AlexaService.start_over_response, start_over: true)
end
