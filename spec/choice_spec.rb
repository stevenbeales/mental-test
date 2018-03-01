# frozen_string_literal: true

require './models/init'

RSpec.describe Choice, type: :model do
  subject { described_class.find_or_create_by! rating_scale: scale, value: 'val', description: 'text' }
  let!(:scale) { RatingScale.find_or_create_by! name: AppConstants::TEST_RATING_SCALE }

  describe '.create!' do
    context 'without a rating scale or value' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'without a rating scale' do
      it { expect { described_class.create! value: 'val', description: 'text' }.to raise_error ActiveRecord::RecordInvalid }
    end
    
    it 'with a rating scale, value and description' do
      expect { described_class.create! rating_scale: scale, value: 'val', description: 'text' }.not_to raise_error
      c = Choice.find_by rating_scale_id: scale.id, value: 'val'
      c.destroy!
    end
  end

  describe '.to_s' do
    it do
      c = Choice.create! rating_scale: scale, value: 'val', description: 'text'
      expect(c.to_s).to eq("#{scale} val text") 
      c = Choice.find_by rating_scale_id: scale.id, value: 'val'
      c.destroy!
    end
  end
end
