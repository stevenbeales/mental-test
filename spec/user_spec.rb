# frozen_string_literal: true

require './models/init'

RSpec.describe User do
  describe '.authenticate' do
    random_user_id = ('a'..'z').to_a.sample(8).join

    it 'creates a user if one does not exist' do
      expect { User.authenticate(random_user_id) }.to change { User.count }.by(1)
    end

    it 'retrieves a user if a one with that name and access token does exist' do
      User.create(username: 'Timmy', access_token: 'AccessToken')
      expect { User.authenticate('Timmy') }.not_to(change { User.count })
      expect(User.authenticate('Timmy').username).to eq 'Timmy'
      expect(User.authenticate('Timmy').access_token).to eq 'AccessToken'
    end
  end
end

RSpec.describe User do
  describe 'Saving to a database' do
    it 'starts out unpersisted' do
      user = User.new
      expect(user.id).to be_nil
    end

    it 'can be persisted' do
      user = User.new(username: 'Timmy', access_token: 'AccessToken')
      user.save

      persisted_user = User.find_by_username 'Timmy'
      expect(persisted_user.id).not_to be_nil
      expect(persisted_user.username).to eq 'Timmy'
      expect(persisted_user.access_token).to eq 'AccessToken'
    end
  end
end
