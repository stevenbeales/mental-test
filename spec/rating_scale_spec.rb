# frozen_string_literal: true

RSpec.describe RatingScale do
  it 'does not save without a name' do
    expect { RatingScale.create! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'does not save with a single character name' do
    expect { RatingScale.create! name: 'a' }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'does save with a name greater than 1 character' do
    expect { RatingScale.create! name: 'as' }.to_not raise_error
  end

  it 'has a unique name' do
    RatingScale.create! name: 'a1'
    expect { RatingScale.create! name: 'a1' }.to raise_error ActiveRecord::RecordInvalid
  end
end
