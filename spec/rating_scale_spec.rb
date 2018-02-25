# frozen_string_literal: true

require './models/init'

RSpec.describe RatingScale do
  it 'does not save without a name' do
    expect { RatingScale.create! }.to raise_error ActiveRecord::RecordInvalid
  end
end
