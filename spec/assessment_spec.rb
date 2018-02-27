# frozen_string_literal: true

require './models/init'

RSpec.describe Assessment do
  it 'does not save without a survey and visit' do
    expect { Assessment.create! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'does not save without a visit' do
    survey = Survey.create! name: Faker::Name.name
    expect { Assessment.create! survey: survey }.to raise_error ActiveRecord::RecordInvalid
    survey.destroy
  end

  it 'does not save without a survey' do
    user = User.create! username: Faker::Internet.unique.user_name
    survey = Survey.create! name: Faker::Name.name
    visit = Visit.create! user: user, name: Faker::Name.name, survey: survey
    expect { Assessment.create! visit: visit }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'saves with a user and a survey' do
    ur = User.create! username: Faker::Internet.unique.user_name
    sy = Survey.create! name: Faker::Name.name
    vt = Visit.create! user: ur, name: Faker::Name.name, survey: sy
    expect { Assessment.create visit: vt, survey: sy }.not_to raise_error
  end
end
