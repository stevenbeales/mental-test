# frozen_string_literal: true

RSpec.describe Participant, type: :model do
  subject { TestFactory.test_participant }

  it 'is an instance of Participant' do
    expect(subject).to be_an Participant
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#respond_to?' do
    it { expect(subject.respond_to?(:email)).to be_truthy }
    it { expect(subject.respond_to?(:user)).to be_truthy }
    it { expect(subject.respond_to?(:survey_participants)).to be_truthy }
    it { expect(subject.respond_to?(:surveys)).to be_truthy }
    it { expect(subject.respond_to?(:created_at)).to be_truthy }
    it { expect(subject.respond_to?(:updated_at)).to be_truthy }
     
    it { expect(subject.respond_to?(:random_name)).not_to be_truthy }
  end

  describe '#email' do
    before(:each) do
      @cached_email = subject.email
    end
    after(:each) do
      subject.email = @cached_email
    end
    it do
      subject.email = nil
      subject.valid?
      expect(subject.errors[:email].size).to eq(1)
    end
  end

  describe '.create!' do
    it 'does not create a participant without an email' do
      expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid
    end
  end

  describe '#to_s' do
    it do
      expect(subject.to_s).to eq("#{subject.identifier} #{subject.email}".strip) 
    end
  end

  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
