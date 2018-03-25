# frozen_string_literal: true

RSpec.describe StudyEventInstrument, type: :model do
  subject { TestFactory.test_study_event_instrument }
  let!(:instrument) { Instrument.find_by_name(TestConstants::TEST_INSTRUMENT) }
  let!(:study_event) { TestFactory.test_study_event }
  
  it 'is an instance of StudyEventInstrument' do
    expect(subject).to be_an StudyEventInstrument
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#respond_to?' do
    it { expect(subject.respond_to?(:study_event)).to be_truthy }
    it { expect(subject.respond_to?(:instrument)).to be_truthy }
    context '#created_at' do
      it { expect(subject.respond_to?(:created_at)).to be_truthy }
    end
    context '#updated_at' do
      it { expect(subject.respond_to?(:updated_at)).to be_truthy }
    end 
    context '#not_an_attibute' do
      it { expect(subject.respond_to?(:not_an_attibute)).not_to be_truthy }
    end
  end

  describe '#instrument' do
    after(:each) do
      subject.restore_attributes
    end
    
    it 'is required' do
      subject.instrument = nil
      subject.valid?
      expect(subject.errors[:instrument].size).to eq(1)
    end
  end
  
  describe '#study_event' do
    after(:each) do
      subject.restore_attributes
    end
    
    it 'is required' do
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
    
    context 'unique instrument and study event' do
      it do 
        expect do
          described_class.create!(instrument: instrument, study_event: study_event)
        end.to raise_error ActiveRecord::RecordInvalid   
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