# frozen_string_literal: true

RSpec.describe Arm, type: :model do
  subject { described_class.find_or_create_by! name: AppConstants::TEST_ARM, schedule: schedule, number: 1 }
  let!(:schedule) { Schedule.find_or_create_by! name: AppConstants::TEST_SCHEDULE, study: study }
  let!(:study) { Study.find_or_create_by! name: AppConstants::TEST_STUDY }
 
 
  describe '.create!' do
    context 'without a name or schedule' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end  

    context 'with 1 character name' do
      it { expect { described_class.create! name: 'a', schedule: schedule }.to raise_error ActiveRecord::RecordInvalid }
    end
    
    context 'with 2+ character name and title' do
      it { expect { described_class.find_or_create_by! name: 'as', schedule: schedule, number: 2 }.to_not raise_error }
    end

    context 'has unique name' do
      it do
        rs = described_class.create! schedule: schedule, number: 3
        expect { described_class.create! schedule: schedule, number: 3 }.to raise_error ActiveRecord::RecordInvalid
        rs.destroy!
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
