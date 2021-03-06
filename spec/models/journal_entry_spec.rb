# frozen_string_literal: true

RSpec.describe JournalEntry, type: :model do
  subject { TestFactory.test_journal_entry }
  let!(:journal) { TestFactory.test_journal }

  include_examples 'valid object creation', JournalEntry

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[entry_date entry journal]
    include_examples 'common attributes'
  end

  include_examples 'required attribute', 'entry_date', 2
  include_examples 'required attribute', 'entry', 1

  describe '#entry' do
    include_context 'restore attributes'

    it 'is valid if blank' do
      subject.entry = ''
      expect(subject.valid?).to be true
    end
  end

  describe '#journal' do
    include_context 'restore attributes'

    it 'is required' do
      subject.journal = nil
      subject.valid?
      expect(subject.errors[:journal].size).to eq(1)
    end
  end

  describe '#entry_date' do
    include_context 'restore attributes'

    it 'is invalid if not a date time' do
      subject.entry_date = '13/13/13'
      expect(subject.valid?).to be false
    end
  end

  include_examples 'invalid create', 'without date or journal'

  describe '.create!' do
    context 'without journal' do
      it do
        expect { described_class.create! entry_date: Date.today }.to raise_error ActiveRecord::RecordInvalid
      end
    end

    context 'without date' do
      it do
        expect { described_class.find_or_create_by! journal: journal }.to_not raise_error
      end
    end

    context 'with journal and date ' do
      it do
        expect do
          JournalEntry.find_or_create_by! journal: journal, entry_date: '12/12/2012'
        end.to_not raise_error
      end
    end

    context 'unique entry date' do
      it timecop: :freeze do
        another_object = described_class.create! journal: journal, entry_date: Date.today.to_date
        begin
          expect do
            described_class.create! journal: journal, entry_date: Date.today.to_date
          end.to raise_error ActiveRecord::RecordInvalid
        ensure
          another_object.destroy!
        end
      end
    end

    describe '#to_s' do
      it { expect(subject.to_s).to eq "#{subject.entry_date} #{subject.entry}" }
    end
  end
end
