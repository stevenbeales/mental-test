# frozen_string_literal: true

Ralyxa::Skill.intent 'LaunchRequest' do
  # Authenticate user. If user doesn't exist, still authenticate user and add them to database
  User.authenticate(request.user_id)
  ask(AlexaService.launch_response)
end
