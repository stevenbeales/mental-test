# frozen_string_literal: true

RSpec.describe Schedule, type: :model do
  subject { TestFactory.test_schedule }
  let!(:study) { TestFactory.test_study }

  it 'is an instance of Schedule' do
    expect(subject).to be_an Schedule
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#respond_to?' do
    it { expect(subject.respond_to?(:name)).to be_truthy }
    it { expect(subject.respond_to?(:study)).to be_truthy }
    it { expect(subject.respond_to?(:arms)).to be_truthy }
    it { expect(subject.respond_to?(:created_at)).to be_truthy }
    it { expect(subject.respond_to?(:updated_at)).to be_truthy }
     
    it { expect(subject.respond_to?(:random_name)).not_to be_truthy }
  end

  describe '#name' do
    before(:each) do
      @cached_name = subject.name
    end

    after(:each) do
      subject.name = @cached_name
    end

    it do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].size).to eq(2)
    end
  end
  
  describe '#study' do
    before(:each) do
      @cached_study = subject.study
    end

    after(:each) do
      subject.study = @cached_study
    end
    
    it do
      subject.study = nil
      subject.valid?
      expect(subject.errors[:study].size).to eq(1)
    end
  end

  describe '.create!' do
    context 'without name or study' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end  

    context '1 character name' do
      it { expect { described_class.create! name: 'a', study: study }.to raise_error ActiveRecord::RecordInvalid }
    end
    
    context '2+ character name and title' do
      it do
        expect { described_class.find_or_create_by! name: 'as', study: study }.to_not raise_error 
        described_class.find_by(name: 'as', study: study).destroy!
      end
    end

    context 'unique name' do
      it do
        another_object = described_class.create! name: 'a12', study: study
        expect { described_class.create! name: 'a12', study: study }.to raise_error ActiveRecord::RecordInvalid
        another_object.destroy!
      end
    end

    describe '#to_s' do
      it { expect(subject.to_s).to eq TestConstants::TEST_SCHEDULE }
    end

    describe '#created_at today' do
      # expect record to be created within the last 5 minutes to check timestamp works
      it { expect(Time.now - subject.created_at).to be < 300 }
    end
  end
end
