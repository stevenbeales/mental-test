# frozen_string_literal: true

RSpec.describe Arm, type: :model do
  subject { TestFactory.test_arm }
  let!(:schedule) { TestFactory.test_schedule }
  let!(:study) { TestFactory.test_study }
  let!(:study_event) { TestFactory.test_study_event }

  it 'is an instance of Arm' do
    expect(subject).to be_an Arm
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#name' do
    it 'is set to arm and number if nil' do
      cached_name = subject.name
      subject.name = nil
      subject.valid?
      expect(subject.name).to eq('arm ' + subject.number.to_s)
      subject.name = cached_name
    end
  end

  describe '#schedule' do
    it 'is required' do
      cached_schedule = subject.schedule
      subject.schedule = nil
      subject.valid?
      expect(subject.errors[:schedule].size).to eq(1)
      subject.schedule = cached_schedule
    end

    context '#schedule nil' do
      it 'study is nil' do
        cached_schedule = subject.schedule
        subject.schedule = nil
        expect(subject.study).to be_nil
        subject.schedule = cached_schedule
      end
    end
  end

  describe '#number' do
    before(:each) do
      @cached_number = subject.number 
    end
    after(:each) do
      subject.number = @cached_number
    end
    
    it 'is required and positive' do
      subject.number = nil
      subject.valid?
      expect(subject.errors[:number].size).to eq(2)
    end
 
    it 'must be positive' do
      subject.number = -1
      subject.valid?
      expect(subject.errors[:number].size).to eq(1)
    end
 
    context 'must be < 10001' do
      it do
        subject.number = 10_001
        subject.valid?
        expect(subject.errors[:number].size).to eq(1)
      end

      it do
        subject.number = 10_000
        subject.valid?
        expect(subject.errors[:number].size).to eq(0)
      end
    end

    context 'must be > 0' do
      it do
        subject.number = 0
        subject.valid?
        expect(subject.errors[:number].size).to eq(1)
      end
    end

    context 'must be an integer' do
      it do
        subject.number = 1.5
        subject.valid?
        expect(subject.errors[:number].size).to eq(1)
      end
    end
  end

  describe '#study_events' do
    it { expect(subject.study_events.count).to eq(1) }
  end

  describe '.create!' do
    context 'no name or schedule' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

    context '1 character name' do
      it { expect { described_class.create! name: 'a', schedule: schedule }.to raise_error ActiveRecord::RecordInvalid }
    end

    context '2+ character name and title' do
      it { expect { described_class.find_or_create_by! name: 'as', schedule: schedule, number: 2 }.to_not raise_error }
    end

    context 'unique name' do
      it do
        another_object = described_class.create! schedule: schedule, number: 3
        expect { described_class.create! schedule: schedule, number: 3 }.to raise_error ActiveRecord::RecordInvalid
        another_object.destroy!
      end
    end

    describe '#destroy!' do
      it do
        another_object = TestFactory.test_arm2
        events = another_object.study_events
        another_object.destroy!
        expect(events.size).to eq(0)
      end
    end

    describe '#to_s' do
      it { expect(subject.to_s).to eq "#{subject.study} #{subject.schedule} #{subject.name} #{subject.number}" }
    end

    describe '#created_at today' do
      # expect record to be created within the last 5 minutes to check timestamp works
      it { expect(Time.now - subject.created_at).to be < 300 }
    end
  end
end
