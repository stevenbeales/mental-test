# frozen_string_literal: true

require './models/init'

RSpec.describe Item do
  describe '.choices' do
    it 'should have 5 choices in first item' do
      item = Instrument.find_by_name('Cesd-r').items[0]
      expect(item.choices.count).to eq(5)
    end
  end

  describe '.find_by_choice' do
    it 'should have 5 choices in first item' do
      item = Instrument.find_by_name('Cesd-r').items[0]
      choice = item.find_choice_by_value('0')
      expect(choice['value']).to eq('0')
    end
  end
end
