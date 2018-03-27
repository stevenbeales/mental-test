# frozen_string_literal: true

RSpec.describe StudyEvent, type: :model do
  subject { TestFactory.test_study_event }
  let!(:arm) { TestFactory.test_arm }
  let!(:schedule) { TestFactory.test_schedule }
  let!(:study) { TestFactory.test_study }
 
  it 'is an instance of StudyEvent' do
    expect(subject).to be_an StudyEvent
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  
  describe '#respond_to?' do
    include_context 'shared attributes'
  
    it { expect(subject.respond_to?(:arm)).to be_truthy }
    it { expect(subject.respond_to?(:schedule)).to be_truthy }
    it { expect(subject.respond_to?(:study_event_instruments)).to be_truthy }
    it { expect(subject.respond_to?(:instruments)).to be_truthy }
    
    include_examples 'attribute?', :study
    include_examples 'name'
    include_examples 'common attributes'
  end

  describe '#name' do
    include_context 'restore attributes'

    it 'is required' do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].size).to eq(2)
    end
  end

  describe '.create!' do
    context 'without name or arm' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end  

    context '1 character name' do
      it { expect { described_class.create! name: 'a', arm: arm }.to raise_error ActiveRecord::RecordInvalid }
    end
    
    context '2+ character name and title' do
      it { expect { described_class.find_or_create_by! name: 'as', arm: arm }.to_not raise_error }
    end

    context 'has unique name' do
      it do
        rs = described_class.create! name: 'a12', arm: arm
        expect { described_class.create! name: 'a12', arm: arm }.to raise_error ActiveRecord::RecordInvalid
        rs.destroy!
      end
    end

    describe '#to_s' do
      it { expect(subject.to_s).to eq "#{study} #{arm} #{TestConstants::TEST_STUDY_EVENT}" }
    end

    describe '#created_at today' do
      # expect record to be created within the last 
      # 5 minutes to check timestamp works
      it 'is created less than 5 minutes ago' do
        expect(Time.now - subject.created_at).to be < 300
      end
    end
  end
end
