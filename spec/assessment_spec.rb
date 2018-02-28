# frozen_string_literal: true

require './models/init'

RSpec.describe Assessment do
  it 'does not save without a survey and visit' do
    expect { Assessment.create! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'does not save without a visit' do
    survey = Survey.create! name: Faker::Name.unique.name
    expect { Assessment.create! survey: survey }.to raise_error ActiveRecord::RecordInvalid
    survey.destroy
  end

  it 'does not save without a survey' do
    user = User.create! username: Faker::Internet.unique.user_name(5..20)
    survey = Survey.create! name: Faker::Name.last_name
    visit = Visit.create! user: user, name: Faker::Name.unique.last_name, survey: survey
    expect { Assessment.create! visit: visit }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'saves with a user and a survey' do
    ur = User.create! username: Faker::Internet.unique.user_name(5..20)
    sy = Survey.create! name: Faker::Name.first_name
    vt = Visit.create! user: ur, name: Faker::Name.first_name, survey: sy
    expect { Assessment.create! visit: vt, survey: sy }.not_to raise_error
  end
end

RSpec.describe Assessment do
  it 'has a user' do
    ur = User.create! username: Faker::Internet.unique.user_name(5..20)
    sy = Survey.create! name: Faker::Name.initials(3)
    vt = Visit.create! user: ur, name: Faker::Name.initials(3), survey: sy
    ass = Assessment.create visit: vt, survey: sy 
    expect(ass.user).to eq(ur)
  end
end
