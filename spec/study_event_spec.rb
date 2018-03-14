# frozen_string_literal: true

RSpec.describe StudyEvent, type: :model do
  subject { TestFactory.test_study_event }
  let!(:arm) { TestFactory.test_arm }
  let!(:schedule) { TestFactory.test_schedule }
  let!(:study) { TestFactory.test_study }
 
  it 'is an instance of Study Event' do
    expect(subject).to be_an StudyEvent
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
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
      it { expect(subject.to_s).to eq "#{study} #{arm} #{AppConstants::TEST_STUDY_EVENT}" }
    end

    describe '#created_at today' do
      # expect record to be created within the last 5 minutes to check timestamp works
      it { expect(Time.now - subject.created_at).to be < 300 }
    end
  end
end
