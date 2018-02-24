# frozen_string_literal: true

require './models/init'

RSpec.describe Instrument do
  describe '.items' do
    it 'loads all items after initializing' do
      ins = Instrument.find_by_name('Cesd-r')
      expect(ins.items).not_to be_empty
    end

    it 'should have 20 items in first instrument' do
      ins = Instrument.find_by_name('Cesd-r')
      expect(ins.items.count).to eq(20)
    end

    it 'should return a list of instrument names' do
      expect(Instrument.list_tests).to eq('Cesd-r')
    end
  end

  describe '.find_item_by_name' do
    it 'finds the item by item name' do
      ins = Instrument.find_by_name('Cesd-r')
      expect(ins.find_item_by_name('Appetite1').name).to eq('Appetite1')
    end
  end

  describe '.name' do
    it 'cannot save without a name' do
      ins = Instrument.new
      expect { ins.save! }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'cannot save without a single character name' do
      ins = Instrument.new name: 'a'
      expect { ins.save! }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
