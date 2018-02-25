# frozen_string_literal: true

require './models/init'

RSpec.describe Choice do
  it 'does not save without a value' do
    expect { Choice.create! }.to raise_error ActiveRecord::RecordInvalid
  end
end
