# frozen_string_literal: true

RSpec.describe Item, type: :model do
  subject { described_class.find_or_create_by name: 'Appetite1' }

  describe '.choices' do
    it 'has 5 choices' do
      expect(subject.choices.count).to eq(5)
    end
  end

  describe '.find_by_choice' do
    it 'has choice eq 0' do
      choice = subject.find_choice_by_value('0')
      expect(choice.value).to eq('0')
    end
  end

  describe '.to_s' do
    it do
      item = Item.new(name: 'Time')
      expect(item.to_s).to eq(item.name) 
    end
  end

  describe '.find_by_name' do
    it 'finds item by name' do
      expect(subject.name).to eq('Appetite1')
    end
  end
end
