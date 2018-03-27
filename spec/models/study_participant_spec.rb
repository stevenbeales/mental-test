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
    include_context 'shared attributes'

    it { expect(subject.respond_to?(:study)).to be_truthy }
    it { expect(subject.respond_to?(:participant)).to be_truthy }
   
    include_examples 'common attributes'
  end

  describe '#study' do
    include_context 'restore attributes'

    it 'is required' do
      subject.study = nil
      subject.valid?
      expect(subject.errors[:study].size).to eq(1)
    end
  end
  
  describe '#participant' do
    include_context 'restore attributes'

    it do
      subject.participant = nil
      subject.valid?
      expect(subject.errors[:participant].size).to eq(1)
    end
  end
  
  describe '.create!' do
    context 'no participant or study' do
      it { expect { StudyParticipant.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'no participant' do
      it do
        expect { StudyParticipant.create! participant: participant }.to \
          raise_error ActiveRecord::RecordInvalid
      end
    end

    context 'no study' do
      it do
        expect do
          StudyParticipant.create! study: study 
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
          StudyParticipant.create!(participant: participant, study: study)
        end.to raise_error ActiveRecord::RecordInvalid   
      end
    end
  end

  describe '#to_s' do
    it do
      expect(StudyParticipant.where(participant: participant, study: study).first.to_s).to \
        eq("#{TestConstants::TEST_PARTICIPANT_EMAIL} #{TestConstants::TEST_STUDY}")
    end
  end
  
  describe '#destroy!' do
    include_context 'destroy subject'

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
