# frozen_string_literal: true

RSpec.describe HipaaIdentifier, type: :model do
  subject { TestFactory.test_hipaa_identifier }
 
  it 'is an instance of HipaaIdentifier' do
    expect(subject).to be_a HipaaIdentifier
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '.create!' do
    context 'without a name' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end  

    context '2 character name' do
      it { expect { described_class.create! name: 'as' }.to raise_error ActiveRecord::RecordInvalid }
    end
    
    context '3+ character name and title' do
      it { expect { described_class.find_or_create_by! name: 'ast' }.to_not raise_error }
    end

    context 'has unique name' do
      it do
        rs = described_class.create! name: 'ame'
        expect { described_class.create! name: 'ame' }.to raise_error ActiveRecord::RecordInvalid
        rs.destroy!
      end
    end

    describe '#to_s' do
      it { expect(subject.to_s).to eq AppConstants::TEST_HIPAA_IDENTIFIER }
    end
  end
end
