# frozen_string_literal: true

RSpec.describe SurveyParticipant, type: :model do
  subject { described_class.find_or_create_by participant: participant, survey: survey }
  let!(:survey) { TestFactory.test_survey }
  let!(:participant) { TestFactory.test_participant }
  
  describe '.create!' do
    context 'no participant or survey' do
      it { expect { subject.class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'no participant' do
      it { expect { subject.class.create! participant: participant }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'no survey' do
      it { expect { subject.class.create! survey: survey }.to raise_error ActiveRecord::RecordInvalid }
    end
 
    context 'survey and participant' do
      it do 
        expect { subject.class.find_or_create_by! participant: participant, survey: survey }.not_to raise_error
      end
    end
  end

  describe '#destroy!' do
    before :each do
      subject.destroy!
    end

    it { expect(Participant.exists?(participant.id)).to be_truthy }

    it { expect(Survey.exists?(survey.id)).to be_truthy }
  end

  describe '#to_s' do
    it do
      expect(subject.class.where(participant: participant, survey: survey).first.to_s).to \
        eq("#{AppConstants::TEST_PARTICIPANT_EMAIL} #{AppConstants::TEST_SURVEY}")
    end
  end

  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
