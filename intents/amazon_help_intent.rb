# frozen_string_literal: true

intent 'AMAZON.HelpIntent' do
  respond AlexaHelper.default_help_response
end
