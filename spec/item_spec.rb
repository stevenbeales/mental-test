# frozen_string_literal: true

RSpec.describe Item, type: :model do
  describe '.choices' do
    it 'should have 5 choices in first item' do
      item = Item.find_by_name('Appetite1')
      expect(item.choices.count).to eq(5)
    end
  end

  describe '.find_by_choice' do
    it 'should have choice in first item eq 0' do
      item = Item.find_by_name('Appetite1')
      choice = item.find_choice_by_value('0')
      expect(choice.value).to eq('0')
    end
  end

  describe '.to_s' do
    it 'prints item name' do
      item = Item.new(name: 'Time')
      expect(item.to_s).to eq(item.name) 
    end
  end

  describe '.find_by_name' do
    it 'finds the item by item name' do
      expect(Item.find_by_name('Appetite1').name).to eq('Appetite1')
    end
  end
end
