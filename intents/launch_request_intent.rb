# frozen_string_literal: true

intent 'LaunchRequest' do
  # Authenticate user. If user doesn't exist, still authenticate user and add them to database
  User.authenticate(request.user_id)
  ask('What would you like to ask me about?')
end
