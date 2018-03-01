# frozen_string_literal: true

RSpec.describe Instrument, type: :model do
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
      expect(Instrument.list_tests).to eq(AppConstants::TEST_INSTRUMENT)
    end
  end
end

RSpec.describe Instrument do
  describe '.name' do
    it 'does not save without a name' do
      ins = Instrument.new
      expect { ins.save! }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'does not save with 1 character name' do
      ins = Instrument.new name: 'a'
      expect { ins.save! }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'does not save with a duplicate name' do
      ins = Instrument.new name: 'Cesd-r'
      expect { ins.save! }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
