# frozen_string_literal: true

require './models/init'

RSpec.describe Visit, type: :model do
  it 'does not save without a survey and visit' do
    expect { Visit.create! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'does not save without a user' do
    survey = Survey.create! name: 'server'
    expect { Visit.create! survey: survey }.to raise_error ActiveRecord::RecordInvalid
    survey.destroy
  end

  it 'does not save without a survey' do
    user = User.create! username: 'sharon'
    expect { Visit.create! user: user }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'saves with a user and a survey' do
    ur = User.create! username: 'maury'
    sy = Survey.create! name: Faker::Name.first_name
    expect { Visit.create! user: ur, name: Faker::Name.first_name, survey: sy }.not_to raise_error
  end
end

RSpec.describe Visit do
  it 'prints .to_s as User Survey and Name' do
    ur = User.create! username: 'bernie'
    sy = Survey.create! name: Faker::Name.initials(3)
    v = Visit.create! user: ur, name: Faker::Name.first_name, survey: sy
    expect(v.to_s).to eq("bernie #{sy.name} #{v.name}")
  end

  it '2 visits are equal if same user, survey and name' do
    ur = User.create! username: 'user compare'
    sy = Survey.create! name: 'survey compare'
    v1 = Visit.create! user: ur, name: 'visit 1', survey: sy
    v2 = Visit.where(user_id: v1.user.id, name: v1.name, survey_id: v1.survey.id).first
    expect(v1).to eq(v2)
  end
end
