# frozen_string_literal: true

require './models/init'

RSpec.describe Choice, type: :model do
  subject { described_class.find_or_create_by! response_scale: scale, value: 'val', description: 'text' }
  let!(:scale) { TestFactory.test_response_scale }

  describe '.create!' do
    context 'without response scale or value' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'without response scale' do
      it { expect { described_class.create! value: 'val', description: 'text' }.to raise_error ActiveRecord::RecordInvalid }
    end
    
    it 'with response scale, value and description' do
      expect { described_class.create! response_scale: scale, value: 'val', description: 'text' }.not_to raise_error
      c = Choice.find_by response_scale_id: scale.id, value: 'val'
      c.destroy!
    end
  end

  describe '#destroy!' do
    it do
      c = Choice.find_or_create_by! response_scale: scale, value: 'val', description: 'text'
      scale.choices.concat(c)
      c.destroy!
      scale.save!
      expect(scale.choices.count.to_s).to eq '0'
    end    
  end

  describe '#to_s' do
    it do
      c = subject
      expect(c.to_s).to eq("#{scale} val text") 
      c = Choice.find_by response_scale_id: scale.id, value: 'val'
      c.destroy!
    end
  end

  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
