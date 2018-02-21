# frozen_string_literal: true

require './models/init'

RSpec.describe User do
  describe '.authenticate' do
    let(:amazon_response) do
      amazon_response = {
        name: 'Timmy Tales'
      }.to_json
    end
    let(:client) { double(:'Net::HTTP', get: amazon_response) }

    it 'creates a user if one does not exist' do
      expect { User.authenticate('AccessToken', client) }.to change { User.count }.by(1)
    end

    it 'retrieves a user if a one with that name and access token does exist' do
      User.create(username: 'Timmy', access_token: 'AccessToken')
      expect { User.authenticate('AccessToken', client) }.not_to(change { User.count })
      expect(User.authenticate('AccessToken', client).username).to eq 'Timmy'
      expect(User.authenticate('AccessToken', client).access_token).to eq 'AccessToken'
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

      persisted_user = User.last
      expect(persisted_user.id).not_to be_nil
      expect(persisted_user.username).to eq 'Timmy'
      expect(persisted_user.access_token).to eq 'AccessToken'
    end
  end
end
