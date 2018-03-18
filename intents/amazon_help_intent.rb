# frozen_string_literal: true

intent 'AMAZON.HelpIntent' do
  respond AlexaService.default_help_response
end
