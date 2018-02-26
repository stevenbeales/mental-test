# frozen_string_literal: true

require './models/init'

RSpec.describe Choice do
  it 'does not save without a value' do
    expect { Choice.create! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'does not save without a rating scale' do
    expect { Choice.create! value: 'val', description: 'text' }.to \
      raise_error ActiveRecord::RecordInvalid
  end
  
  it 'saves with a rating scale, value and description' do
    scale = RatingScale.find_by_name 'Cesd-r'
    expect { Choice.create! rating_scale: scale, value: 'val', description: 'text' }.not_to raise_error
    c = Choice.find_by rating_scale_id: scale.id, value: 'val'
    c.destroy
  end
end
