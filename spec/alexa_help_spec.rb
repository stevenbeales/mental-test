# frozen_string_literal: true

require './models/init'

RSpec.describe AlexaHelp do
  describe '.default_help_response' do
    it { expect(AlexaHelp.default_help_response).to eq(AlexaHelp::DEFAULT_HELP_RESPONSE) }
  end
end
