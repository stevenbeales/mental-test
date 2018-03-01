# frozen_string_literal: true

RSpec.describe RatingScale, type: :model do
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
  
  it 'destroys choices in a rating scale ' do
    scale = RatingScale.create! name: Faker::Name.last_name
    c = Choice.create! rating_scale: scale, value: 'val', description: 'text'
    c2 = Choice.create! rating_scale: scale, value: 'val2', description: 'text2'
    c3 = Choice.create! rating_scale: scale, value: 'val3', description: 'text3'
    scale.choices.concat [c, c2, c3]   
    expect { scale.destroy }.not_to raise_error
  end

  it 'has .to_s' do
    scale = RatingScale.find_by_name 'Cesd-r'
    expect(scale.to_s).to eq('Cesd-r') 
  end
end
