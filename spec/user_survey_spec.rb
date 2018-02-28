# frozen_string_literal: true

require './models/init'

RSpec.describe UserSurvey do
  it 'does not save without a user and survey' do
    expect { UserSurvey.create! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'does not save without a user' do
    survey = Survey.create! name: 'Survey 21'
    expect { UserSurvey.create! survey: survey }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'does not save without a survey' do
    user = User.create! username: Faker::Internet.unique.user_name(5..20)
    expect { UserSurvey.create! user: user }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'does save with a user and a survey' do
    user = User.create! username: Faker::Internet.unique.user_name(5..22)
    survey = Survey.create! name: Faker::Name.unique.last_name
    expect { UserSurvey.create! user: user, survey: survey }.not_to raise_error
  end
end
