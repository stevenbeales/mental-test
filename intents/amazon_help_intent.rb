# frozen_string_literal: true

intent 'AMAZON.HelpIntent' do
  respond AlexaHelp.default_help_response
end
