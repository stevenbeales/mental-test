# frozen_string_literal: true

RSpec.describe JournalEntry, type: :model do
  subject { TestFactory.test_journal_entry }
  let!(:journal) { TestFactory.test_journal }

  it 'is an instance of JournalEntry' do
    expect(subject).to be_an JournalEntry
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#respond_to?' do
    it { expect(subject.respond_to?(:entry_date)).to be_truthy }
    it { expect(subject.respond_to?(:entry)).to be_truthy }
    it { expect(subject.respond_to?(:journal)).to be_truthy }
    it { expect(subject.respond_to?(:created_at)).to be_truthy }
    it { expect(subject.respond_to?(:updated_at)).to be_truthy }
     
    it { expect(subject.respond_to?(:random_name)).not_to be_truthy }
  end

  describe '#entry_date' do
    after(:each) do
      subject.restore_attributes
    end

    it do
      subject.entry_date = nil
      subject.valid?
      expect(subject.errors[:entry_date].size).to eq(1)
    end
  end
  
  describe '#entry' do
    after(:each) do
      subject.restore_attributes
    end

    it do
      subject.entry = nil
      subject.valid?
      expect(subject.errors[:entry].size).to eq(1)
    end

    it do
      subject.entry = ''
      expect(subject.valid?).to be true
    end
  end

  describe '#journal' do
    after(:each) do
      subject.restore_attributes
    end
    
    it do
      subject.journal = nil
      subject.valid?
      expect(subject.errors[:journal].size).to eq(1)
    end
  end

  describe '.create!' do
    context 'without date or journal' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end  

    context 'without journal' do
      it do 
        expect do
          described_class.create! entry_date: Date.today
        end.to raise_error ActiveRecord::RecordInvalid 
      end
    end

    context 'without date' do
      it do 
        expect { described_class.find_or_create_by! journal: journal }.to_not raise_error 
      end
    end
    
    context 'with journal and date ' do
      it do
        expect { JournalEntry.find_or_create_by! journal: journal, entry_date: '12/12/2012' }.to_not raise_error 
      end
    end

    context 'unique entry date' do
      it timecop: :freeze do
        another_object = described_class.create! journal: journal, entry_date: Date.today.noon.to_date
        expect do 
          described_class.create! journal: journal, entry_date: Date.today.noon.to_date
        end.to raise_error ActiveRecord::RecordInvalid
        another_object.destroy!
      end
    end

    describe '#to_s' do
      it { expect(subject.to_s).to eq "#{subject.entry_date} #{subject.entry}" }
    end

    describe '#created_at today' do
      # expect record to be created within the last 5 minutes to check timestamp works
      it { expect(Time.now - subject.created_at).to be < 300 }
    end
  end
end
