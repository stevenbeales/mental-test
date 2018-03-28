# frozen_string_literal: true

RSpec.describe StudyParticipant, type: :model do
  subject { TestFactory.test_study_participant }
  let!(:study) { TestFactory.test_study }
  let!(:participant) { TestFactory.test_participant }
  
  include_examples 'valid', StudyParticipant
  
  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'attribute?', :study
    include_examples 'attribute?', :participant
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
      include_examples 'invalid create' 
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
end
