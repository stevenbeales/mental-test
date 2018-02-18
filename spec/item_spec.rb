require './models/init'

RSpec.describe Item do
  describe '.choices' do
    it 'should have 5 choices in first item' do
      item = Instrument.first.items[0]
      expect(item.choices.count).to eq(5)
    end
  end
end