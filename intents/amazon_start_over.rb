# frozen_string_literal: true

intent 'AMAZON.StartOverIntent' do
  ask('OK, what would you like to do?', start_over: true)
end
