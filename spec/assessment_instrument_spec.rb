# frozen_string_literal: true

RSpec.describe AssessmentInstrument, type: :model do
  subject { TestFactory.test_assessment_instrument }
  let!(:instrument) { Instrument.find_by name: AppConstants::TEST_INSTRUMENT }
  let!(:assess) { TestFactory.test_assessment }
  
  it 'is an instance of AssessmentInstrument' do
    expect(subject).to be_an AssessmentInstrument
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '.create!' do
    context 'no instrument or assessment' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'no instrument' do
      it { expect { described_class.create! assessment: assess }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'no assessment' do
      it { expect { described_class.create! instrument: instrument }.to raise_error ActiveRecord::RecordInvalid }
    end
 
    context 'with assessment and instrument' do
      it do 
        expect { described_class.find_or_create_by instrument: instrument, assessment: assess }.not_to raise_error
      end
    end
  end
  
  describe '#to_s' do
    it do 
      expect(described_class.where(assessment: assess.id, instrument: instrument.id) \
      .first.to_s).to eq("#{assess} #{instrument}")
    end
  end

  describe '#destroy!' do
    before :each do
      subject.destroy!
    end

    it { expect(Instrument.exists?(instrument.id)).to be_truthy }
   
    it { expect(Assessment.exists?(assess.id)).to be_truthy }
  end
  
  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
