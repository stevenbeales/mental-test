# frozen_string_literal: true

RSpec.describe AlexaService do
  describe '.default_help_response' do
    it { expect(AlexaService.default_help_response).to eq(AlexaService::DEFAULT_HELP_RESPONSE) }
  end
  
  describe '.default_testname_slot' do
    it { expect(AlexaService::DEFAULT_TESTNAME_SLOT).to eq(AlexaService::DEFAULT_TESTNAME_SLOT) }
  end
end
