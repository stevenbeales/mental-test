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

  describe '#respond_to?' do
    include_context 'shared attributes'
    context '#name' do
      it { expect(subject.respond_to?(:name)).to be_truthy }
    end
    context '#number' do
      it { expect(subject.respond_to?(:number)).to be_truthy }
    end
    context '#schedule' do
      it { expect(subject.respond_to?(:schedule)).to be_truthy }
    end
    context '#study' do
      it { expect(subject.respond_to?(:study)).to be_truthy }
    end
    context '#study_events' do
      it { expect(subject.respond_to?(:study_events)).to be_truthy }
    end
    context 'common attributes' do
      it { expect(timestamps?).to be_truthy }
    end 
  end

  describe '#name' do
    it 'is set to "arm1" if missing' do
      subject.name = nil
      subject.valid?
      expect(subject.name).to eq('arm ' + subject.number.to_s)
      subject.restore_attributes
    end
  end

  describe '#schedule' do
    after(:each) do
      subject.restore_attributes
    end
    
    it 'is required' do
      subject.schedule = nil
      subject.valid?
      expect(subject.errors[:schedule].size).to eq(1)
    end

    context 'missing schedule' do
      it 'study is nil' do
        subject.schedule = nil
        expect(subject.study).to be_nil
      end
    end

    context '#arms' do
      it do
        subject.schedule.arms.concat(subject)
        expect(subject.schedule.arms.index(subject)).not_to be_nil 
      end
      
      it do
        subject.schedule.arms.concat(subject)
        expect(subject.schedule.arms.size).to be > 0 
      end
    end
  end

  describe '#study' do
    it 'equals test study' do
      expect(subject.schedule.study).to eq(subject.study)
    end
  end

  describe '#number' do
    after(:each) do
      subject.restore_attributes
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

      it 'must equal 10000' do
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
      it do 
        expect do
          described_class.create! 
        end.to raise_error ActiveRecord::RecordInvalid
      end
    end

    context '1 character name' do
      it do
        expect do 
          described_class.create! name: 'a', 
                                  schedule: schedule 
        end.to raise_error ActiveRecord::RecordInvalid
      end
    end

    context '2+ character name and title' do
      it do 
        expect do 
          described_class.find_or_create_by! name: 'as', 
                                             schedule: schedule, 
                                             number: 2 
        end.to_not raise_error 
      end
    end

    context 'unique name' do
      it do
        another_object = described_class.create! schedule: schedule, number: 3
        expect { described_class.create! schedule: schedule, number: 3 }.to \
          raise_error ActiveRecord::RecordInvalid
        another_object.destroy!
      end
    end

    describe '#destroy!' do
      it 'also removes study_events' do
        another_object = TestFactory.test_arm2
        events = another_object.study_events
        another_object.destroy!
        expect(events.size).to eq(0)
      end
    end

    describe '#to_s' do
      it 'prints study schedule name number' do
        expect(subject.to_s).to eq "#{subject.study} #{subject.schedule} " \
                                   + "#{subject.name} #{subject.number}" 
      end  
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
