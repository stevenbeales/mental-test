# frozen_string_literal: true

require './models/init'

RSpec.describe Assessment do
  it 'does not save without a survey and user' do
    expect { Assessment.create! }.to raise_error ActiveRecord::RecordInvalid
  end
end
