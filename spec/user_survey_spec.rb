# frozen_string_literal: true

require './models/init'

RSpec.describe UserSurvey, type: :model do
  subject { described_class.find_or_create_by user: user, survey: survey }
  
  let!(:survey) { Survey.find_or_create_by name: AppConstants::TEST_SURVEY }
  let!(:user) { User.create! username: AppConstants::TEST_USER }
  
  describe '#create!' do
    context 'with no user or survey' do
      it { expect { subject.class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'with no survey' do
      it { expect { subject.class.create! user: user }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'with no survey' do
      it { expect { subject.class.create! survey: survey }.to raise_error ActiveRecord::RecordInvalid }
    end
 
    context 'with survey and user' do
      it do 
        expect { subject.class.find_or_create_by user: user, survey: survey }.not_to raise_error
      end
    end
  end

  describe '#destroy!' do
    before :each do
      subject.destroy!
    end

    context 'when user is not destroyed' do
      it { expect(User.exists?(user.id)).to be_truthy }
    end

    context 'when survey is not destroyed' do
      it { expect(Survey.exists?(survey.id)).to be_truthy }
    end
  end

  describe '#to_s' do
     content 'username and survey name' do
        
     end
  end
end

  it 'prints .to_s as username and survey name' do
    user = User.create! username: 'fake user'
    survey = Survey.create! name: 'test survey'
    expect((UserSurvey.create! user: user, survey: survey).to_s).to eq('fake user test survey')
  end
end
