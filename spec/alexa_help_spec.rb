# frozen_string_literal: true

require './models/init'

RSpec.describe AlexaHelp do
  it 'has a default response' do
    expect(AlexaHelp.default_help_response).to eq(AlexaHelp::DEFAULT_HELP_RESPONSE)
  end
end
