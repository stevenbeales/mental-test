# frozen_string_literal: true

RSpec.describe Study, type: :model do
  subject { TestFactory.test_study }
  let!(:test_study2) { TestFactory.test_study2 }
  let!(:schedule) { TestFactory.test_schedule }
  
  it 'is an instance of Study' do
    expect(subject).to be_an Study
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#respond_to?' do
    include_context 'shared attributes'

    it { expect(subject.respond_to?(:schedule)).to be_truthy }
    it { expect(subject.respond_to?(:study_participants)).to be_truthy }
    it { expect(subject.respond_to?(:participants)).to be_truthy }
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
    context 'without a name' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end  

    context '1 character name' do
      it { expect { described_class.create! name: 'a' }.to raise_error ActiveRecord::RecordInvalid }
    end
    
    context '2+ character name and title' do
      it { expect { described_class.find_or_create_by! name: 'as' }.to_not raise_error }
    end

    context 'has unique name' do
      it do
        rs = described_class.create! name: 'a12'
        expect { described_class.create! name: 'a12' }.to raise_error ActiveRecord::RecordInvalid
        rs.destroy!
      end
    end

    describe '#to_s' do
      it { expect(subject.to_s).to eq TestConstants::TEST_STUDY }
    end

    describe '#created_at today' do
      # expect record to be created within the last 
      # 5 minutes to check timestamp works
      it 'is created less than 5 minutes ago' do
        expect(Time.now - subject.created_at).to be < 300
      end
    end

    describe '#destroy' do
      it do
        sc = test_study2.schedule
        test_study2.destroy!
        expect(sc).to be_nil  
      end
    end
  end
end
