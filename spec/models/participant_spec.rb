# frozen_string_literal: true

RSpec.describe Participant, type: :model do
  subject { TestFactory.test_participant }

  include_examples 'valid object creation', Participant

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'responds', :journal
    include_examples 'responds', :survey_participants
    include_examples 'responds', :surveys
    include_examples 'responds', :user
    include_examples 'responds', :email
    include_examples 'common attributes'
  end

  describe '#email' do
    include_context 'restore attributes'
    
    it 'is required' do
      subject.email = nil
      subject.valid?
      expect(subject.errors[:email].size).to eq(1)
    end
  
    context 'when the email address is valid' do
      let(:email) { Faker::Internet.email }

      it 'allows the input' do
        subject.email = email
        expect(subject).to be_valid
      end
    end

    context 'when the email address is invalid' do
      let(:invalid_message) { 'is invalid' }

      it 'invalidates the input' do
        subject.email = 'not_valid@'
        expect(subject).not_to be_valid
      end

      it 'alerts the consumer' do
        subject.email = 'notvalid'
        subject.valid?
        expect(subject.errors[:email]).to include(invalid_message)
      end
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

  include_examples 'invalid create', 'does not create a participant without an email'
 
  describe '#to_s' do
    it do
      to_s = "#{subject.identifier} #{subject.email}".strip
      expect(subject.to_s).to eq to_s
    end
  end
end
