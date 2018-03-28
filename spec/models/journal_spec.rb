# frozen_string_literal: true

RSpec.describe Journal, type: :model do
  subject { TestFactory.test_journal }
  let!(:participant) { TestFactory.test_participant }

  include_examples 'valid', Journal

  describe '#respond_to?' do    
    include_context 'shared attributes'

    include_examples 'attribute?', :journal_entries
    include_examples 'attribute?', :participant
    include_examples 'attribute?', :name
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
      expect(subject.read_entry(Date.today).size).to be > 0
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

  describe '.create!' do
    context 'without name or study' do
      it do
        expect { Journal.create! }.to raise_error \
          ActiveRecord::RecordInvalid 
      end
    end  

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
        another_object = described_class.create! name: 'a14', 
                                                 participant: participant
        expect do 
          described_class.create! name: 'a14', 
                                  participant: participant 
        end.to raise_error ActiveRecord::RecordInvalid
        another_object.destroy!
      end
    end

    describe '#to_s' do
      it { expect(subject.to_s).to eq TestConstants::TEST_JOURNAL }
    end

    describe '#create_entry_for_today' do
      it { expect(subject.journal_entries.size).to be > 0 }
    end

    describe '#created_at today' do
      # expect record to be created within the last 
      # 5 minutes to check timestamp works
      it 'is created less than 5 minutes ago' do
        expect(Time.now - subject.created_at).to be < 300
      end
    end
  end
end
