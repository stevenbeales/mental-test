# frozen_string_literal: true

require './models/init'

RSpec.describe Assessment do
  it 'does not save without a survey and visit' do
    expect { Assessment.create! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'does not save without a visit' do
    survey = Survey.create! name: 'random survey'
    expect { Assessment.create! survey: survey }.to raise_error ActiveRecord::RecordInvalid
    survey.destroy
  end

  it 'does not save without a survey' do
    user = User.create! username: 'random user'
    survey = Survey.create! name: 'random survey 2'
    visit = Visit.create! user: user, name: 'visit 5', survey: survey
    expect { Assessment.create! visit: visit }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'saves with a user and a survey' do
    ur = User.create! username: 'random user11'
    sy = Survey.create! name: 'random survey21'
    vt = Visit.create! user: ur, name: 'visit 7', survey: sy
    expect { Assessment.create visit: vt, survey: sy }.not_to raise_error
  end
end
