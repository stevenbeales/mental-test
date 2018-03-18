# frozen_string_literal: true

intent 'AMAZON.MoreIntent' do
  respond AlexaService.default_help_response
end
