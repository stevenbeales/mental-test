# frozen_string_literal: true

RSpec.describe Schedule, type: :model do
  subject { described_class.find_or_create_by! name: AppConstants::TEST_SCHEDULE, study: study }
  let!(:study) { TestFactory.test_study }
 
 
  describe '.create!' do
    context 'without name or study' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end  

    context '1 character name' do
      it { expect { described_class.create! name: 'a', study: study }.to raise_error ActiveRecord::RecordInvalid }
    end
    
    context '2+ character name and title' do
      it { expect { described_class.find_or_create_by! name: 'as', study: study }.to_not raise_error }
    end

    context 'unique name' do
      it do
        rs = described_class.create! name: 'a12', study: study
        expect { described_class.create! name: 'a12', study: study }.to raise_error ActiveRecord::RecordInvalid
        rs.destroy!
      end
    end

    describe '#to_s' do
      it { expect(subject.to_s).to eq AppConstants::TEST_SCHEDULE }
    end

    describe '#created_at today' do
      # expect record to be created within the last 5 minutes to check timestamp works
      it { expect(Time.now - subject.created_at).to be < 300 }
    end
  end
end
