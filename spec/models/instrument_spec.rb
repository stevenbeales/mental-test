# frozen_string_literal: true

RSpec.describe Instrument, type: :model do
  subject { Instrument.find_or_create_by! name: TestConstants::TEST_INSTRUMENT }
  
  it 'is an instance of Instrument' do
    expect(subject).to be_an Instrument
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  
  describe '#respond_to?' do
    include_context 'shared attributes'

    context '#name' do
      it { expect(subject.respond_to?(:name)).to be_truthy }
    end
    it { expect(subject.respond_to?(:content)).to be_truthy }
    it { expect(subject.respond_to?(:title)).to be_truthy }
    it { expect(subject.respond_to?(:instructions)).to be_truthy }
    it { expect(subject.respond_to?(:pages)).to be_truthy }
    it { expect(subject.respond_to?(:assessment_instruments)).to be_truthy }
    it { expect(subject.respond_to?(:assessments)).to be_truthy }
    it { expect(subject.respond_to?(:study_event_instruments)).to be_truthy }
    it { expect(subject.respond_to?(:study_events)).to be_truthy }
    it { expect(subject.respond_to?(:items)).to be_truthy }
    context 'common attributes' do
      it { expect(timestamps?).to be_truthy }
    end 
  end

  describe '#name' do
    include_context 'restore attributes'

    it 'is required' do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].size).to eq(2)
    end
  end
  
  describe 'test instrument #items' do
    it 'is not empty' do
      expect(subject.items).not_to be_empty
    end

    it 'has 20 items' do
      expect(subject.items.count).to eq(20)
    end
  end

  describe '#items' do
    context 'has no items' do 
      it do
        ins2 = described_class.find_or_create_by! name: 'Instrument 2'
        expect(ins2.items.count).to eq 0 
      end
    end
  end

  describe '.list_tests' do
    it 'should return a list of instrument names' do
      expect(described_class.list_tests(limit: 10)).to \
        include(TestConstants::TEST_INSTRUMENT)
    end
  end

  describe '#save!' do
    it 'without a name' do
      ins = described_class.new
      expect { ins.save! }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'with 1 character name' do
      ins = described_class.new name: 'a'
      expect { ins.save! }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'with duplicate name' do
      ins = described_class.new name: TestConstants::TEST_INSTRUMENT
      expect { ins.save! }.to raise_error ActiveRecord::RecordInvalid
    end
  end

  describe '#to_s' do
    it { expect(subject.to_s).to eq(TestConstants::TEST_INSTRUMENT) }
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
        expect(described_class.with_any_tags('Anxiety')&.first&.name).to \
          eq subject.name
      end
    end

    context 'absent' do
      it do
        expect(described_class.with_any_tags('Depression')&.first).to be_nil
      end
    end
  end

  describe '#instructions' do
    it { expect(subject.instructions).to include 'felt or behaved' }
  end

  describe '#created_at today' do
    # expect record to be created within the last 
    # 5 minutes to check timestamp works
    it 'is created less than 5 minutes ago' do
      expect(Time.now - subject.created_at).to be < 300
    end
  end
end
