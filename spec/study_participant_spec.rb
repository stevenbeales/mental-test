# frozen_string_literal: true

RSpec.describe StudyParticipant, type: :model do
  subject { described_class.find_or_create_by participant: participant, study: study }
  let!(:study) { TestFactory.test_study }
  let!(:participant) { TestFactory.test_participant }
  
  it 'is an instance of Study Participant' do
    expect(subject).to be_an StudyParticipant
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  
  describe '#respond_to?' do
    it { expect(subject.respond_to?(:study)).to be_truthy }
    it { expect(subject.respond_to?(:participant)).to be_truthy }
    it { expect(subject.respond_to?(:journal)).to be_truthy }
    it { expect(subject.respond_to?(:created_at)).to be_truthy }
    it { expect(subject.respond_to?(:updated_at)).to be_truthy }
   
    it { expect(subject.respond_to?(:random_name)).not_to be_truthy }
  end

  describe '#study' do
    before(:each) do
      @cached_study = subject.study
    end
   
    after(:each) do
      subject.study = @cached_study
    end
   
    it do
      subject.study = nil
      subject.valid?
      expect(subject.errors[:study].size).to eq(1)
    end
  end
  
  describe '#participant' do
    before(:each) do
      @cached_participant = subject.participant
    end
   
    after(:each) do
      subject.participant = @cached_participant
    end
   
    it do
      subject.participant = nil
      subject.valid?
      expect(subject.errors[:participant].size).to eq(1)
    end
  end
  
  describe '.create!' do
    context 'no participant or study' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'no participant' do
      it { expect { described_class.create! participant: participant }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'no study' do
      it { expect { described_class.create! study: study }.to raise_error ActiveRecord::RecordInvalid }
    end
 
    context 'study and participant' do
      it do 
        expect { described_class.find_or_create_by! participant: participant, study: study }.not_to raise_error
      end
    end
    
    context 'unique study and participant' do
      it do 
        expect do
          described_class.create!(participant: participant, study: study)
        end.to raise_error ActiveRecord::RecordInvalid   
      end
    end
  end

  describe '#to_s' do
    it do
      expect(described_class.where(participant: participant, study: study).first.to_s).to \
        eq("#{TestConstants::TEST_PARTICIPANT_EMAIL} #{TestConstants::TEST_STUDY}")
    end
  end
  
  describe '#destroy!' do
    before :each do
      subject.destroy!
    end

    it { expect(Participant.exists?(participant.id)).to be_truthy }

    it { expect(Study.exists?(study.id)).to be_truthy }
  end

  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
