# frozen_string_literal: true

RSpec.describe AlexaService do
  subject { described_class.new(user) }
  let!(:user) { TestFactory.test_user }
    
  it { expect(subject).to be_an AlexaService }
  
  describe '.help_response' do
    it do 
      expect(AlexaService.help_response).to \
        eq(AlexaConstants::HELP_RESPONSE) 
    end
  end

  describe '.launch_response' do
    it do
      expect(AlexaService.launch_response).to \
        eq(AlexaConstants::LAUNCH_RESPONSE)
    end
  end
  
  describe '.start_over_response' do
    it do
      expect(AlexaService.start_over_response).to \
        eq(AlexaConstants::START_OVER_RESPONSE) 
    end
  end
  
  describe '.goodbye_response' do
    it do
      expect(AlexaService.goodbye_response).to \
        eq(AlexaConstants::GOODBYE_RESPONSE) 
    end
  end

  describe '.testname_slot' do
    it do
      expect(AlexaService::TESTNAME_SLOT).to \
        eq(AlexaConstants::TESTNAME_SLOT)
    end
  end

  describe '.list_tests' do
    it do 
      expect(AlexaService.list_tests).to \
        include(Instrument.list_tests(limit: 4)) 
    end

    it do 
      expect(AlexaService.list_tests).to \
        include(Instrument.count.to_s) 
    end
  end

  describe '.start_test' do
    it do
      expect(AlexaService.start_test(testname: 'blah')).to \
        eq format(AlexaConstants::CANNOT_FIND_INSTRUMENT_ERROR, \
                  instrument: 'blah')
    end

    it do
      expect(AlexaService.start_test(testname: \
        AppConstants::DEFAULT_INSTRUMENT)).to \
          eq(Instrument.find_by(name: \
            AppConstants::DEFAULT_INSTRUMENT).instructions)
    end
  end

  describe '#read_all' do
    it do
      entries = user.journal&.list_entries(limit: 4)
      expect(subject.read_all).to eq(entries)
    end
    
    it do
      expect(subject.read_all).not_to be_nil 
    end
  end
end
