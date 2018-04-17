# frozen_string_literal: true

RSpec.describe Choice, type: :model do
  subject { TestFactory.test_choice }
  let!(:scale) { InstrumentTestFactory.test_response_scale }

  include_examples 'valid object creation', Choice

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[response_scale responses description]
    include_examples 'respond', %i[score value]
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

  include_examples 'invalid create', 'without response scale or description' 
  
  describe '.create!' do
    context 'without response scale' do
      it do 
        expect do
          described_class.create! value: 'val', description: 'text'
        end.to raise_error ActiveRecord::RecordInvalid
      end
    end
    
    it 'with response scale, value and description' do
      begin
        expect do
          begin
            choice = Choice.find_or_create_by! response_scale: scale, value: 'val', description: 'text' 
          ensure
            choice.destroy!
          end
        end.not_to raise_error
      end
    end
  end
  
  describe '#to_s' do
    it do
      choice = subject
      expect(choice.to_s).to eq("#{scale} val text") 
    end
  end

  describe '#destroy!' do
    it do
      choice = TestFactory.test_choice
      begin
        scale.choices.concat(choice)
      ensure
        choice.destroy!
        scale.save!
        expect(scale.choices.count.to_s).to eq '0'
      end
    end    
  end
end
