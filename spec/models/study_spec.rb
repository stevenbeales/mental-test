# frozen_string_literal: true

RSpec.describe Study, type: :model do
  subject { TestFactory.test_study }
  let!(:test_study2) { TestFactory.test_study2 }
  let!(:schedule) { TestFactory.test_schedule }
  
  include_examples 'valid object creation', Study

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'responds', :study_participants
    include_examples 'responds', :participants
    include_examples 'responds', :schedule
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

  include_examples 'create!_with_name', 'without a name', TestConstants::TEST_STUDY 

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
