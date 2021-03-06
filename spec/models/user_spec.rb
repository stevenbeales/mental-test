# frozen_string_literal: true

RSpec.describe User, type: :model do
  subject { TestFactory.test_user }
  let!(:survey) { TestFactory.test_survey }
  let!(:participant) { TestFactory.test_participant }

  include_examples 'valid object creation', User

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[username survey_participants surveys visits]
    include_examples 'respond', %i[assessments participant preferences locale journal]
    include_examples 'discard attribute'
    include_examples 'common attributes'
  end

  include_examples 'required attribute', 'username', 2

  describe '#locale' do
    include_context 'restore attributes'

    it { expect(subject.locale).to eq('en-US') }

    it do
      subject.locale = 'en-GB'
      expect(subject.locale).to eq('en-GB')
    end
  end

  describe '.authenticate' do
    it 'creates a user if one does not exist' do
      expect { User.authenticate('Strangely') }.to change { User.count }.by(1)
    end

    it 'retrieves a user if name and access token exists' do
      timmy = create(:timmy)
      expect { User.authenticate(timmy.username) }.not_to(change { User.count })
      expect(User.authenticate(timmy.username).username).to eq timmy.username
      expect(User.authenticate(timmy.username).access_token).to eq timmy.access_token
    end

    it 'does not create a user without a username' do
      expect { User.authenticate('') }.to change { User.count }.by(0)
    end

    it 'does not create a user with a name shorter than 5 characters' do
      expect { User.authenticate('Lisa') }.to change { User.count }.by(0)
    end
  end

  describe 'Saving to a database' do
    it 'starts out unpersisted' do
      user = User.new
      expect(user.id).to be_nil
    end

    it 'can be persisted' do
      user = build(:timmy)
      user.save!

      persisted_user = User.find_by_username 'Timmy'
      expect(persisted_user.id).not_to be_nil
      expect(persisted_user.username).to eq 'Timmy'
      expect(persisted_user.access_token).to eq 'AccessToken'
    end

    it 'has unique name' do
      expect { User.authenticate('Timmy') }.to change { User.count }.by(0)
    end

    it 'is a participant' do
      subject.save!
      expect(subject.participant).not_to be_nil
    end
  end

  describe '#to_s' do
    it 'prints username' do
      user = build(:timmy)
      expect(user.to_s).to eq(user.username)
    end
  end

  describe '#discard' do
    let!(:user) { build(:timmy) }
    before :each do
      user.discard
    end

    context 'does not delete' do
      it do
        expect(user.discarded?).to eq true
      end

      it do
        discarded = User.discarded.first
        expect(discarded.id).to eq user.id
      end

      it do
        expect(User.kept.include?(user)).to be_falsey
      end
    end
  end
end
