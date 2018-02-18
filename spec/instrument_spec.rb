require './models/init'

RSpec.describe Instrument do
  describe '.items' do
    it 'loads all items after initializing' do
      ins = Instrument.first
      expect(ins.items).not_to be_empty
    end

    it 'should have 20 items in first instrument' do
      ins = Instrument.first
      expect(ins.items.count).to eq(20)
    end
  end
end
