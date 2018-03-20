# frozen_string_literal: true

RSpec.describe AlexaService do
  subject { described_class.new }
  
  it { expect(subject).to be_an AlexaService }
  
  describe '.default_help_response' do
    it { expect(AlexaService.default_help_response).to eq(AlexaService::DEFAULT_HELP_RESPONSE) }
  end
  
  describe '.default_testname_slot' do
    it { expect(AlexaService::DEFAULT_TESTNAME_SLOT).to eq(AlexaService::DEFAULT_TESTNAME_SLOT) }
  end

  describe '.list_tests' do
    it { expect(AlexaService.list_tests).to eq(Instrument.list_tests) }
  end

end
