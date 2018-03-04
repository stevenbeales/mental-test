# frozen_string_literal: true

RSpec.describe Instrument, type: :model do
  subject { described_class.find_or_create_by name: AppConstants::TEST_INSTRUMENT }

  describe '#items' do
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

  describe '#tags' do
    it do
      subject.tags = %w[Depression Anxiety] 
      subject.tags -= %w[Depression]
      subject.tags += %w[Schizophrenia]
      expect(subject.tags).to eq %w[Anxiety Schizophrenia] 
    end
  end

  describe '#with_any_tags' do
    context 'present' do
      it do
        subject.tags = %w[Depression Anxiety] 
        subject.tags -= %w[Depression]
        subject.tags += %w[Schizophrenia]
        subject.save!
        expect(described_class.with_any_tags('Anxiety')&.first&.name).to eq subject.name
      end
    end

    context 'absent' do
      it do
        expect(described_class.with_any_tags('Depression')&.first).to be_nil
      end
    end
  end

  describe 'created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
