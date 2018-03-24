# frozen_string_literal: true

RSpec.describe AlexaService do
  subject { described_class.new(user) }
  let!(:user) { TestFactory.test_user }
    
  it { expect(subject).to be_an AlexaService }
  
  describe '.help_response' do
    it { expect(AlexaService.help_response).to eq(AlexaConstants::HELP_RESPONSE) }
  end

  describe '.launch_response' do
    it { expect(AlexaService.launch_response).to eq(AlexaConstants::LAUNCH_RESPONSE) }
  end
  
  describe '.start_over_response' do
    it { expect(AlexaService.start_over_response).to eq(AlexaConstants::START_OVER_RESPONSE) }
  end
  
  describe '.goodbye_response' do
    it { expect(AlexaService.goodbye_response).to eq(AlexaConstants::GOODBYE_RESPONSE) }
  end

  describe '.testname_slot' do
    it { expect(AlexaService::TESTNAME_SLOT).to eq(AlexaConstants::TESTNAME_SLOT) }
  end

  describe '.list_tests' do
    it { expect(AlexaService.list_tests).to include(Instrument.list_tests(limit: 4)) }
    it { expect(AlexaService.list_tests).to include(Instrument.count.to_s) }
  end

  describe '.start_test' do
    it do
      expect(AlexaService.start_test(testname: 'blah')).to \
        eq(format(AlexaConstants::CANNOT_FIND_INSTRUMENT_ERROR, instrument: 'blah'))
    end

    it do
      expect(AlexaService.start_test(testname: AppConstants::DEFAULT_INSTRUMENT)).to \
        eq(Instrument.find_by(name: AppConstants::DEFAULT_INSTRUMENT).instructions)
    end
  end

  describe '#read_all' do
    it do
      expect(subject.read_all).to eq(user.journal&.list_entries(limit: 4)&.join(' '))
    end
    
    it do
      expect(subject.read_all).not_to be_nil 
    end
  end
end
