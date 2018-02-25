# frozen_string_literal: true

require './models/init'

RSpec.describe Assessment do
  it 'does not save without a survey and user' do
    expect { Assessment.create! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'does not save without a survey' do
    survey = Survey.create! name: 'random survey'
    expect { Assessment.create! survey: survey }.to raise_error ActiveRecord::RecordInvalid
    survey.destroy
  end

  it 'does not save without a user' do
    user = User.create! username: 'random user'
    expect { Assessment.create! user: user }.to raise_error ActiveRecord::RecordInvalid
  end
end
