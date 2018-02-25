# frozen_string_literal: true

require './models/init'

RSpec.describe Response do
  it 'does not save without an assessment' do
    expect { Response.create! }.to raise_error ActiveRecord::RecordInvalid
  end
end
