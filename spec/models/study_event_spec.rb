# frozen_string_literal: true

RSpec.describe StudyEvent, type: :model do
  subject { TestFactory.test_study_event }
  let!(:arm) { TestFactory.test_arm }
  let!(:schedule) { TestFactory.test_schedule }
  let!(:study) { TestFactory.test_study }
 
  include_examples 'valid object creation', StudyEvent

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'responds', :study_event_instruments
    include_examples 'responds', :instruments
    include_examples 'responds', :arm
    include_examples 'responds', :schedule
    include_examples 'responds', :study
    include_examples 'responds', :name
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

  include_examples 'invalid create', 'without name or arm'
  
  describe '.create!' do
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
  end

  describe '#to_s' do
    it { expect(subject.to_s).to eq "#{study} #{arm} #{TestConstants::TEST_STUDY_EVENT}" }
  end
end
