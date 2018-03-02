# frozen_string_literal: true

RSpec.describe Instrument, type: :model do
  subject { described_class.find_or_create_by name: AppConstants::TEST_INSTRUMENT }

  describe '.items' do
    it 'loads all items after initializing' do
      expect(subject.items).not_to be_empty
    end

    it 'should have 20 items in first instrument' do
      expect(subject.items.count).to eq(20)
    end

    it 'should return a list of instrument names' do
      expect(described_class.list_tests).to eq(AppConstants::TEST_INSTRUMENT)
    end
  end

  describe '#name' do
    it 'does not save without a name' do
      ins = described_class.new
      expect { ins.save! }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'does not save with 1 character name' do
      ins = described_class.new name: 'a'
      expect { ins.save! }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'does not save with duplicate name' do
      ins = described_class.new name: AppConstants::TEST_INSTRUMENT
      expect { ins.save! }.to raise_error ActiveRecord::RecordInvalid
    end
  end

  describe '#to_s' do
    it { expect(subject.to_s).to eq(AppConstants::TEST_INSTRUMENT) }
  end

  describe '#version' do
    it { expect(subject.version_number).to eq('1.0') }
  end
end
