# frozen_string_literal: true

RSpec.describe StudyEventInstrument, type: :model do
  subject { TestFactory.test_study_event_instrument }
  let!(:instrument) { Instrument.find_by_name(TestConstants::TEST_INSTRUMENT) }
  let!(:study_event) { TestFactory.test_study_event }
  
  include_examples 'valid', StudyEventInstrument

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'attribute?', :study_event
    include_examples 'attribute?', :instrument
    include_examples 'common attributes'
  end

  describe '#instrument' do
    include_context 'restore attributes'
   
    it 'is required' do
      subject.instrument = nil
      subject.valid?
      expect(subject.errors[:instrument].size).to eq(1)
    end
  end
  
  describe '#study_event' do
    include_context 'restore attributes'
    
    it 'is required' do
      subject.study_event = nil
      subject.valid?
      expect(subject.errors[:study_event].size).to eq(1)
    end
  end
  
  describe '.create!' do
    context 'with no instrument or StudyEvent' do
      include_examples 'invalid create' 
    end

    context 'with no instrument' do
      it { expect { described_class.create! study_event: study_event }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'with no StudyEvent' do
      it { expect { described_class.create! instrument: instrument }.to raise_error ActiveRecord::RecordInvalid }
    end
 
    context 'with StudyEvent and instrument' do
      it do 
        expect do
          described_class.find_or_create_by! instrument: instrument, study_event: study_event
        end.not_to raise_error
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
    include_context 'destroy subject'
   
    it { expect(Instrument.exists?(instrument.id)).to be_truthy }
    it { expect(StudyEvent.exists?(study_event.id)).to be_truthy }
  end
end
