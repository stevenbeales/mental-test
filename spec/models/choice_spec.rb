# frozen_string_literal: true

RSpec.describe Choice, type: :model do
  subject { TestFactory.test_choice }
  let!(:scale) { InstrumentTestFactory.test_response_scale }

  include_examples 'valid', Choice

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'attribute?', :response_scale
    include_examples 'attribute?', :responses
    include_examples 'attribute?', :description
    include_examples 'attribute?', :score
    include_examples 'attribute?', :value
    include_examples 'common attributes'
  end
 
  describe '#response_scale' do
    include_context 'restore attributes'
    
    it 'is required' do
      subject.response_scale = nil
      subject.valid?
      expect(subject.errors[:response_scale].size).to eq(1)
    end
  end
  
  describe '#value' do
    include_context 'restore attributes'
    
    it 'is required' do
      subject.value = nil
      subject.valid?
      expect(subject.errors[:value].size).to eq(1)
    end
  end

  describe '#description' do
    include_context 'restore attributes'
    
    it do
      subject.description = nil
      subject.valid?
      expect(subject.errors[:description].size).to eq(1)
    end
  end

  describe '.create!' do
    context 'without response scale or description' do
      include_examples 'invalid create' 
    end

    context 'without response scale' do
      it do 
        expect do
          described_class.create! value: 'val', description: 'text'
        end.to raise_error ActiveRecord::RecordInvalid
      end
    end
    
    it 'with response scale, value and description' do
      expect do
        described_class.find_or_create_by! response_scale: scale, 
                                           value: 'val', 
                                           description: 'text' 
      end.not_to raise_error
      c = Choice.find_by response_scale_id: scale.id, value: 'val'
      c.destroy!
    end
  end

  describe '#to_s' do
    it do
      c = subject
      expect(c.to_s).to eq("#{scale} val text") 
    end
  end

  describe '#destroy!' do
    it do
      c = TestFactory.test_choice
      scale.choices.concat(c)
      c.destroy!
      scale.save!
      expect(scale.choices.count.to_s).to eq '0'
    end    
  end
end
