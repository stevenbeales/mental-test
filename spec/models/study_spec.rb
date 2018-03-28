# frozen_string_literal: true

RSpec.describe Study, type: :model do
  subject { TestFactory.test_study }
  let!(:test_study2) { TestFactory.test_study2 }
  let!(:schedule) { TestFactory.test_schedule }
  
  include_examples 'valid', Study

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'attribute?', :study_participants
    include_examples 'attribute?', :participants
    include_examples 'attribute?', :schedule
    include_examples 'attribute?', :name
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

  describe '.create!' do
    context 'without a name' do
      include_examples 'invalid create' 
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
      it { expect(subject.to_s).to eq TestConstants::TEST_STUDY }
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
