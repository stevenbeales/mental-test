# frozen_string_literal: true

require './models/init'

RSpec.describe User, type: :model do
  subject { described_class.find_or_create_by!(username: 'Steven') }

  describe '.authenticate' do
    it 'creates a user if one does not exist' do
      expect { described_class.authenticate(Faker::Internet.unique.user_name(5..20)) }.to change { User.count }.by(1)
    end

    it 'retrieves a user if a one with that name and access token does exist' do
      described_class.create(username: 'Timmy', access_token: 'AccessToken')
      expect { described_class.authenticate('Timmy') }.not_to(change { described_class.count })
      expect(described_class.authenticate('Timmy').username).to eq 'Timmy'
      expect(described_class.authenticate('Timmy').access_token).to eq 'AccessToken'
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
      user = described_class.new(username: 'Timmy', access_token: 'AccessToken')
      user.save

      persisted_user = described_class.find_by_username 'Timmy'
      expect(persisted_user.id).not_to be_nil
      expect(persisted_user.username).to eq 'Timmy'
      expect(persisted_user.access_token).to eq 'AccessToken'
    end

    it 'must have a unique name' do
      expect { described_class.authenticate('Timmy') }.to change { described_class.count }.by(0)
    end
  end

  describe '.to_s' do
    it 'prints username' do
      user = described_class.new(username: 'Timmy')
      expect(user.to_s).to eq(user.username) 
    end
  end

  describe 'created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
