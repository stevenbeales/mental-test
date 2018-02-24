# frozen_string_literal: true

require './models/init'

RSpec.describe UserSurvey do
  it 'does not save without a user and survey' do
    expect { UserSurvey.create! }.to raise_error ActiveRecord::RecordInvalid
  end
end
