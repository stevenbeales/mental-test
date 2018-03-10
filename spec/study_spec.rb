# frozen_string_literal: true

RSpec.describe Study, type: :model do
  subject { TestFactory.test_study }
  let!(:test_study2) { TestFactory.test_study2 }
  let!(:schedule) { TestFactory.test_schedule }
  
 
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
      it { expect(subject.to_s).to eq AppConstants::TEST_STUDY }
    end

    describe '#created_at today' do
      # expect record to be created within the last 5 minutes to check timestamp works
      it { expect(Time.now - subject.created_at).to be < 300 }
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
