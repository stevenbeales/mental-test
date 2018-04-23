# frozen_string_literal: true

RSpec.describe Instrument, type: :model do
  subject { Instrument.find_or_create_by! name: TestConstants::TEST_INSTRUMENT }
  
  describe '.list_tests' do
    it 'should return a list of instrument names' do
      expect(Instrument.list_tests(limit: 10)).to include(TestConstants::TEST_INSTRUMENT)
    end
  end

  describe 'search' do
    context '.search_json' do
      it 'should find pages in default instrument' do
        expect(Instrument.search_json("pages")&.first&.id).to eq(subject.id)
      end

      it 'should not find zzz in json in any instrument' do
        expect(Instrument.search_json("zzz")&.first).to be_nil
      end
    end

    context '.search_csv' do
      it 'should not find default instrument in CSV' do
        expect(Instrument.search_csv("pages")&.first).to be_nil
      end
    end

    context '.multisearch' do
      it { expect(PgSearch.multisearch("pages")&.first&.id).to eq(subject.id) }

      it { expect(PgSearch.multisearch("zzz")&.first).to be_nil }
    end
  end

  include_examples 'valid object creation', Instrument
  
  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[assessment_instruments assessments study_event_instruments]
    include_examples 'respond', %i[study_events instructions csv_content json_content]
    include_examples 'respond', %i[title pages items name instrument_type version_number] 
    include_examples 'discard attribute'
    include_examples 'common attributes'
  end

  include_examples 'required attribute', 'name', 2
  include_examples 'required attribute', 'version_number', 1
  include_examples 'required attribute', 'instrument_type', 1
 
  include_examples 'default attribute', 'instrument_type', 'json'
  include_examples 'default attribute', 'version_number', '1.0'
  include_examples 'default attribute', 'csv_content', ''
   
  describe '#items for test instrument' do
    it 'is not empty' do
      expect(subject.items).not_to be_empty
    end

    it 'has 20 items' do
      expect(subject.items.count).to eq(20)
    end
  end

  describe '#content for test instrument' do
    it { expect(subject.csv_content.length).to eq 0 }
  end

  describe '#first_question_and_instructions for test instrument' do
    it { expect(subject.first_question_and_instructions).to include 'felt or behaved' }
    it { expect(subject.first_question_and_instructions).to include 'appetite' }
  end

  describe '#items' do
    context 'has no items' do 
      it do
        ins2 = Instrument.find_or_create_by! name: 'Instrument 2'
        expect(ins2.items.count).to eq 0 
      end
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
  
  describe '#discard' do
    instrument2 = Instrument.find_or_create_by! name: 'Instrument 2'
    include_examples 'discards', instrument2
  end
end
