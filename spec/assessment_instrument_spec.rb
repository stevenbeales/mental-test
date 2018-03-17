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

  describe '#respond_to?' do
    it { expect(subject.respond_to?(:assessment)).to be_truthy }
    it { expect(subject.respond_to?(:instrument)).to be_truthy }
    it { expect(subject.respond_to?(:created_at)).to be_truthy }
    it { expect(subject.respond_to?(:updated_at)).to be_truthy }
   
    it { expect(subject.respond_to?(:random_name)).not_to be_truthy }
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

    it do
      expect(subject.instrument.id).to eq(instrument.id)
    end
  end
  
  describe '#assessment' do
    before(:each) do
      @cached_assessment = subject.assessment
    end

    after(:each) do
      subject.assessment = @cached_assessment
    end

    it do
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

    context 'unique instrument and assessment' do
      it do 
        expect do
          described_class.create!(instrument: instrument, assessment: assess)
        end.to raise_error ActiveRecord::RecordInvalid   
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
