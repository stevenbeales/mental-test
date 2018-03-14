# frozen_string_literal: true

RSpec.describe User, type: :model do
  subject { TestFactory.test_user }
  let!(:survey) { TestFactory.test_survey }
  let!(:participant) { TestFactory.test_participant }

  it 'is an instance of a User' do
    expect(subject).to be_a User 
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '.authenticate' do
    it 'creates a user if one does not exist' do
      expect { described_class.authenticate(Faker::Internet.unique.user_name(5..20)) }.to change { User.count }.by(1)
    end

    it 'retrieves a user if name and access token exists' do
      timmy = create(:timmy)
      expect { described_class.authenticate(timmy.username) }.not_to(change { described_class.count })
      expect(described_class.authenticate(timmy.username).username).to eq timmy.username
      expect(described_class.authenticate(timmy.username).access_token).to eq timmy.access_token
    end

    it 'does not create a user without a username' do
      expect { described_class.authenticate('') }.to change { described_class.count }.by(0)
    end

    it 'does not create a user with a name shorter than 5 characters' do
      expect { described_class.authenticate('Lisa') }.to change { described_class.count }.by(0)
    end
  end

  describe 'Saving to a database' do
    it 'starts out unpersisted' do
      user = described_class.new
      expect(user.id).to be_nil
    end

    it 'can be persisted' do
      user = build(:timmy)
      user.save

      persisted_user = described_class.find_by_username 'Timmy'
      expect(persisted_user.id).not_to be_nil
      expect(persisted_user.username).to eq 'Timmy'
      expect(persisted_user.access_token).to eq 'AccessToken'
    end

    it 'has unique name' do
      expect { described_class.authenticate('Timmy') }.to change { described_class.count }.by(0)
    end

    it 'may be survey participant' do
      subject.participant = participant
      subject.save!
      expect(subject.participant.id).to eq(participant.id)
    end
  end

  describe '#to_s' do
    it do
      user = build(:timmy)
      expect(user.to_s).to eq(user.username) 
    end
  end

  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
