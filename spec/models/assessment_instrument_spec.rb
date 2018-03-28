# frozen_string_literal: true

RSpec.describe AssessmentInstrument, type: :model do
  subject { TestFactory.test_assessment_instrument }
  let!(:instrument) { InstrumentTestFactory.test_instrument }
  let!(:assess) { TestFactory.test_assessment }
  
  include_examples 'valid object creation', AssessmentInstrument

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'responds', :assessment
    include_examples 'responds', :instrument
    include_examples 'common attributes'
  end

  describe '#instrument' do
    include_context 'restore attributes'
   
    it 'is required' do
      subject.instrument = nil
      subject.valid?
      expect(subject.errors[:instrument].size).to eq(1)
    end

    it 'equals instrument' do
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

    it 'equals assessment' do
      expect(subject.assessment.id).to eq(assess.id)
    end
  end

  include_examples 'invalid create', 'no assessment or instrument'   
  
  describe '.create!' do
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
end
