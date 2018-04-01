# frozen_string_literal: true

RSpec.describe Instrument, type: :model do
  subject { Instrument.find_or_create_by! name: TestConstants::TEST_INSTRUMENT }
  
  include_examples 'valid object creation', Instrument
  
  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'responds', :assessment_instruments
    include_examples 'responds', :assessments
    include_examples 'responds', :study_event_instruments
    include_examples 'responds', :study_events
    include_examples 'responds', :instructions
    include_examples 'responds', :csv_content
    include_examples 'responds', :json_content
    include_examples 'responds', :title
    include_examples 'responds', :pages
    include_examples 'responds', :items
    include_examples 'responds', :name
    include_examples 'common attributes'
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

  include_examples 'create!_with_name', 'without a name', TestConstants::TEST_INSTRUMENT

  include_examples '#to_s', 'Name', TestConstants::TEST_INSTRUMENT

  describe '#version' do
    it { expect(subject.version_number).to eq('1.0') }
  end

  describe '#instructions' do
    it { expect(subject.instructions).to include 'felt or behaved' }
  end
end
