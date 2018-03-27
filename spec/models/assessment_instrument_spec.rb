# frozen_string_literal: true

RSpec.describe AssessmentInstrument, type: :model do
  subject { TestFactory.test_assessment_instrument }
  let!(:instrument) { InstrumentTestFactory.test_instrument }
  let!(:assess) { TestFactory.test_assessment }
  
  it 'is an instance of AssessmentInstrument' do
    expect(subject).to be_an AssessmentInstrument
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#respond_to?' do
    include_context 'shared attributes'

    context '#assessment' do
      it { expect(attribute?(:assessment)).to be_truthy }
    end
    context '#instrument' do
      it { expect(attribute?(:instrument)).to be_truthy }
    end 
    context 'common attributes' do
      it { expect(timestamps?).to be_truthy }
    end 
  end

  describe '#instrument' do
    include_context 'restore attributes'
   
    it 'is required' do
      subject.instrument = nil
      subject.valid?
      expect(subject.errors[:instrument].size).to eq(1)
    end

    it do
      expect(subject.instrument.id).to eq(instrument.id)
    end
  end
  
  describe '#assessment' do
    include_context 'restore attributes'

    it 'is required' do
      subject.assessment = nil
      subject.valid?
      expect(subject.errors[:assessment].size).to eq(1)
    end

    it do
      expect(subject.assessment.id).to eq(assess.id)
    end
  end

  describe '.create!' do
    context 'no instrument or assessment' do
      it do
        expect { described_class.create! }.to raise_error \
          ActiveRecord::RecordInvalid
      end
    end

    context 'no instrument' do
      it do 
        expect do 
          AssessmentInstrument.create! assessment: assess 
        end.to raise_error ActiveRecord::RecordInvalid 
      end
    end

    context 'no assessment' do
      it do 
        expect do 
          AssessmentInstrument.create! instrument: instrument 
        end.to raise_error ActiveRecord::RecordInvalid
      end
    end
 
    context 'with assessment and instrument' do
      it do 
        expect do
          AssessmentInstrument.find_or_create_by instrument: instrument, 
                                                 assessment: assess
        end.not_to raise_error
      end
    end

    context 'unique instrument and assessment' do
      it do 
        expect do
          AssessmentInstrument.create!(instrument: instrument, assessment: assess)
        end.to raise_error ActiveRecord::RecordInvalid   
      end
    end
  end
  
  describe '#to_s' do
    it do 
      expect(AssessmentInstrument.where(assessment: assess.id, 
                                        instrument: instrument.id) \
                                   .first.to_s).to eq("#{assess} #{instrument}")
    end
  end

  describe '#destroy!' do
    include_context 'destroy subject'

    it { expect(Instrument.exists?(instrument.id)).to be_truthy }
   
    it { expect(Assessment.exists?(assess.id)).to be_truthy }
  end
  
  describe '#created_at today' do
    # expect record to be created within the last 
    # 5 minutes to check timestamp works
    it 'is created less than 5 minutes ago' do
      expect(Time.now - subject.created_at).to be < 300
    end
  end
end
