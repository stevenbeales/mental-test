# frozen_string_literal: true

RSpec.describe HipaaIdentifier, type: :model do
  subject { TestFactory.test_hipaa_identifier }
 
  include_examples 'valid object creation', HipaaIdentifier

  describe '#respond_to?' do
    include_context 'shared attributes'
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

  include_examples 'create!_with_name', 'without a name', TestConstants::TEST_HIPAA_IDENTIFIER

  describe '#to_s' do
    it { expect(subject.to_s).to eq TestConstants::TEST_HIPAA_IDENTIFIER }
  end
end
