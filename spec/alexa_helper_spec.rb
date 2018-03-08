# frozen_string_literal: true

require './models/init'

RSpec.describe AlexaHelper do
  describe '.default_help_response' do
    it { expect(AlexaHelper.default_help_response).to eq(AlexaHelper::DEFAULT_HELP_RESPONSE) }
  end
  describe '.default_testname_slot' do
    it { expect(AlexaHelper::DEFAULT_TESTNAME_SLOT).to eq('testname') }
  end
end
