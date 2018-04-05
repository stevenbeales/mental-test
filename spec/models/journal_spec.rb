# frozen_string_literal: true

RSpec.describe Journal, type: :model do
  subject { TestFactory.test_journal }
  let!(:participant) { TestFactory.test_participant }

  include_examples 'valid object creation', Journal

  describe '#respond_to?' do    
    include_context 'shared attributes'
    include_examples 'responds', :journal_entries
    include_examples 'responds', :participant
    include_examples 'responds', :name
    include_examples 'common attributes'
  end

  describe '#list_entries' do
    context 'defaults to last 4' do
      it do
        expect(subject.list_entries).to eq subject.journal_entries \
          .order('entry_date DESC').limit(4).join(' ') 
      end
    end
  end

  describe '#read_entry' do
    it do
      expect(subject.read_entry(day: Date.today).size).to be > 0
    end
  end

  describe '#read_last' do
    it do
      expect(subject.read_last.size).to eq 1
    end

    it do
      expect(subject.read_last(last_n: 2).size).to eq 2
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
  
  describe '#participant' do
    include_context 'restore attributes'
     
    it 'is required' do
      subject.participant = nil
      subject.valid?
      expect(subject.errors[:participant].size).to eq(1)
    end
  end

  include_examples 'invalid create', 'without name or study' 

  describe '.create!' do
    context '1 character name' do
      it do 
        expect do
          Journal.create! name: 'a', participant: participant
        end.to raise_error ActiveRecord::RecordInvalid 
      end
    end
    
    context '2+ character name and title' do
      it do
        expect do
          Journal.find_or_create_by! name: 'as', 
                                     participant: participant 
        end.to_not raise_error 
        Journal.find_by(name: 'as', participant: participant).destroy!
      end
    end

    context 'unique name' do
      it do
        another_object = Journal.create! name: 'a14', 
                                         participant: participant
        expect do 
          Journal.create! name: 'a14', 
                          participant: participant 
        end.to raise_error ActiveRecord::RecordInvalid
        another_object.destroy!
      end
    end

    include_examples '#to_s', 'Name', TestConstants::TEST_JOURNAL 
    
    describe '#create_entry_for_today' do
      it { expect(subject.journal_entries.size).to be > 0 }
    end
  end
end
