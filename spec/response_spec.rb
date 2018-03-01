# frozen_string_literal: true

require './models/init'

RSpec.describe Response, type: :model do
  it 'does not save without an assessment' do
    expect { Response.create! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'does not save without a value' do
    ur = User.create! username: Faker::Internet.unique.user_name(5..20)
    sy = Survey.create! name: Faker::Name.prefix
    vt = Visit.create! user: ur, name: Faker::Name.prefix, survey: sy
    ass = Assessment.create visit: vt, survey: sy 
    expect { Response.create! assessment: ass }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'saves with a value and an assessment' do
    ur = User.create! username: Faker::Internet.unique.user_name(5..20)
    sy = Survey.create! name: Faker::Name.initials(2)
    vt = Visit.create! user: ur, name: Faker::Name.initials(2), survey: sy
    ass = Assessment.create visit: vt, survey: sy 
    expect { Response.create! assessment: ass, value: 'something' }.not_to raise_error
  end
end
