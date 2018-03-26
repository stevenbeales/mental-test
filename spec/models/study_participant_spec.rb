# frozen_string_literal: true

RSpec.describe StudyParticipant, type: :model do
  subject { TestFactory.test_study_participant }
  let!(:study) { TestFactory.test_study }
  let!(:participant) { TestFactory.test_participant }
  
  it 'is an instance of StudyParticipant' do
    expect(subject).to be_an StudyParticipant
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  
  describe '#respond_to?' do
    it { expect(subject.respond_to?(:study)).to be_truthy }
    it { expect(subject.respond_to?(:participant)).to be_truthy }
    context '#created_at' do
      it { expect(subject.respond_to?(:created_at)).to be_truthy }
    end
    context '#updated_at' do
      it { expect(subject.respond_to?(:updated_at)).to be_truthy }
    end 
    context '#not_an_attibute' do
      it { expect(subject.respond_to?(:not_an_attibute)).not_to be_truthy }
    end
  end

  describe '#study' do
    after(:each) do
      subject.restore_attributes
    end

    it 'is required' do
      subject.study = nil
      subject.valid?
      expect(subject.errors[:study].size).to eq(1)
    end
  end
  
  describe '#participant' do
    after(:each) do
      subject.restore_attributes
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
      it do
        expect { described_class.create! participant: participant }.to \
          raise_error ActiveRecord::RecordInvalid
      end
    end

    context 'no study' do
      it do
        expect do
          described_class.create! study: study 
        end.to raise_error ActiveRecord::RecordInvalid
      end
    end
 
    context 'study and participant' do
      it do 
        expect do
          StudyParticipant.find_or_create_by! participant: participant, study: study
        end.not_to raise_error
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
    # expect record to be created within the last 
    # 5 minutes to check timestamp works
    it 'is created less than 5 minutes ago' do
      expect(Time.now - subject.created_at).to be < 300
    end
  end
end
