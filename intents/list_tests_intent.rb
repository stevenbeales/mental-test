# frozen_string_literal: true

intent 'ListTests' do
  respond(AlexaService.list_tests)
end
