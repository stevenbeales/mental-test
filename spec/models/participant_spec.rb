# frozen_string_literal: true

RSpec.describe Participant, type: :model do
  subject { TestFactory.test_participant }

  include_examples 'valid', Participant

  describe '#respond_to?' do
    include_context 'shared attributes'

    it { expect(subject.respond_to?(:journal)).to be_truthy }
    it { expect(subject.respond_to?(:survey_participants)).to be_truthy }
    it { expect(subject.respond_to?(:surveys)).to be_truthy }
  
    include_examples 'attribute?', :user
    include_examples 'attribute?', :email
    include_examples 'common attributes'
  end

  describe '#email' do
    include_context 'restore attributes'
    
    it 'is required' do
      subject.email = nil
      subject.valid?
      expect(subject.errors[:email].size).to eq(1)
    end
  end

  describe '#journal' do
    include_context 'restore attributes'
    
    it 'is required' do
      subject.journal = nil
      subject.valid?
      expect(subject.errors[:journal].size).to eq(1)
    end
  end

  describe '.create!' do
    context 'does not create a participant without an email' do
      include_examples 'invalid create' 
    end
  end

  describe '#to_s' do
    it do
      to_s = "#{subject.identifier} #{subject.email}".strip
      expect(subject.to_s).to eq to_s
    end
  end
end
