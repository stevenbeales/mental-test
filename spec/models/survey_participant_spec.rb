# frozen_string_literal: true

RSpec.describe SurveyParticipant, type: :model do
  subject { TestFactory.test_survey_participant }
  let!(:survey) { TestFactory.test_survey }
  let!(:participant) { TestFactory.test_participant }
  
  include_examples 'valid object creation', SurveyParticipant
  
  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[survey participant]
    include_examples 'common attributes'
  end

  describe '#survey' do
    include_context 'restore attributes'
   
    it 'is required' do
      subject.survey = nil
      subject.valid?
      expect(subject.errors[:survey].size).to eq(1)
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
  
  include_examples 'invalid create', 'no participant or survey' 
  
  describe '.create!' do
    context 'no participant' do
      it do
        expect { SurveyParticipant.create! participant: participant }.to raise_error ActiveRecord::RecordInvalid
      end
    end

    context 'no survey' do
      it do
        expect { SurveyParticipant.create! survey: survey }.to raise_error ActiveRecord::RecordInvalid
      end
    end
 
    context 'survey and participant' do
      it do 
        expect do
          SurveyParticipant.find_or_create_by! participant: participant, survey: survey 
        end.not_to raise_error
      end
    end
    
    context 'unique survey and participant' do
      it do 
        expect do
          described_class.create!(participant: participant, survey: survey)
        end.to raise_error ActiveRecord::RecordInvalid   
      end
    end
  end

  describe '#to_s' do
    it do
      expect(described_class.where(participant: participant, survey: survey).first.to_s).to \
        eq("#{TestConstants::TEST_PARTICIPANT_EMAIL} #{TestConstants::TEST_SURVEY}")
    end
  end
  
  describe '#destroy!' do
    include_context 'destroy subject'

    it { expect(Participant.exists?(participant.id)).to be_truthy }
    it { expect(Survey.exists?(survey.id)).to be_truthy }
  end
end
