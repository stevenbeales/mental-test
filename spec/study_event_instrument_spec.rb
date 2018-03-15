# frozen_string_literal: true

RSpec.describe StudyEventInstrument, type: :model do
  subject { TestFactory.test_study_event_instrument }
  let!(:instrument) { Instrument.find_by_name(AppConstants::TEST_INSTRUMENT) }
  let!(:study_event) { TestFactory.test_study_event }
  
  it 'is an instance of Study Event Instrument' do
    expect(subject).to be_an StudyEventInstrument
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#instrument' do
    before(:each) do
      @cached_instrument = subject.instrument
    end
    after(:each) do
      subject.instrument = @cached_instrument
    end
    it do
      subject.instrument = nil
      subject.valid?
      expect(subject.errors[:instrument].size).to eq(1)
    end
  end
  
  describe '#study_event' do
    before(:each) do
      @cached_study_event = subject.study_event
    end
    after(:each) do
      subject.study_event = @cached_study_event
    end
    it do
      subject.study_event = nil
      subject.valid?
      expect(subject.errors[:study_event].size).to eq(1)
    end
  end

  
  describe '.create!' do
    context 'with no instrument or StudyEvent' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'with no instrument' do
      it { expect { described_class.create! study_event: study_event }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'with no StudyEvent' do
      it { expect { described_class.create! instrument: instrument }.to raise_error ActiveRecord::RecordInvalid }
    end
 
    context 'with StudyEvent and instrument' do
      it do 
        expect { described_class.find_or_create_by! instrument: instrument, study_event: study_event }.not_to raise_error
      end
    end
  end

  describe '#to_s' do
    it do 
      expect(described_class.where(study_event: study_event, instrument: instrument).first.to_s).to \
        eq("#{study_event} #{instrument}")
    end
  end

  describe '#destroy!' do
    before :each do
      subject.destroy!
    end

    it { expect(Instrument.exists?(instrument.id)).to be_truthy }
    
    it { expect(StudyEvent.exists?(study_event.id)).to be_truthy }
  end
 

  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
