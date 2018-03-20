# frozen_string_literal: true

RSpec.describe AlexaService do
  subject { described_class.new }
  
  it { expect(subject).to be_an AlexaService }
  
  describe '.help_response' do
    it { expect(AlexaService.help_response).to eq(AlexaConstants::HELP_RESPONSE) }
  end
  
  describe '.testname_slot' do
    it { expect(AlexaService::TESTNAME_SLOT).to eq(AlexaConstants::TESTNAME_SLOT) }
  end

  describe '.list_tests' do
    it { expect(AlexaService.list_tests).to eq(Instrument.list_tests) }
  end

end
