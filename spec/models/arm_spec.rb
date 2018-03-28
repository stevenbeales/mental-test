# frozen_string_literal: true

RSpec.describe Arm, type: :model do
  subject { TestFactory.test_arm }
  let!(:schedule) { TestFactory.test_schedule }
  let!(:study) { TestFactory.test_study }
  let!(:study_event) { TestFactory.test_study_event }

  include_examples 'valid', Arm

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'attribute?', :schedule
    include_examples 'attribute?', :study
    include_examples 'attribute?', :study_events
    include_examples 'attribute?', :number
    include_examples 'attribute?', :name
    include_examples 'common attributes'
  end

  describe '#name' do
    context 'when missing' do
      it 'set to "arm1"' do
        subject.name = nil
        subject.valid?
        expect(subject.name).to eq('arm ' + subject.number.to_s)
        subject.restore_attributes
      end
    end
  end

  describe '#schedule' do
    include_context 'restore attributes'
    
    it 'is required' do
      subject.schedule = nil
      subject.valid?
      expect(subject.errors[:schedule].size).to eq(1)
    end

    context 'when missing' do
      it 'study is nil' do
        subject.schedule = nil
        expect(subject.study).to be_nil
      end
    end

    context '#arms' do
      it 'includes arm' do
        subject.schedule.arms.concat(subject)
        expect(subject.schedule.arms).to include(subject) 
      end
      
      it do
        subject.schedule.arms.concat(subject)
        expect(subject.schedule.arms).not_to be_empty 
      end
    end
  end

  context '#study' do
    it 'equals schedule study' do
      expect(subject.study.id).to eq(subject.schedule.study.id)
    end
  end

  describe '#number' do
    include_context 'restore attributes'
    include_examples 'number'
  end

  describe '#study_events' do
    it { expect(subject.study_events.count).to eq(1) }
  end

  describe '.create!' do
    context 'no name or schedule' do
      include_examples 'invalid create' 
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
  end
end
