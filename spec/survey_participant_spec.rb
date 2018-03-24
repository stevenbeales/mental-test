# frozen_string_literal: true

RSpec.describe SurveyParticipant, type: :model do
  subject { described_class.find_or_create_by participant: participant, survey: survey }
  let!(:survey) { TestFactory.test_survey }
  let!(:participant) { TestFactory.test_participant }
  
  it 'is an instance of SurveyParticipant' do
    expect(subject).to be_an SurveyParticipant
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  
  describe '#respond_to?' do
    it { expect(subject.respond_to?(:survey)).to be_truthy }
    it { expect(subject.respond_to?(:participant)).to be_truthy }
    it { expect(subject.respond_to?(:created_at)).to be_truthy }
    it { expect(subject.respond_to?(:updated_at)).to be_truthy }
   
    it { expect(subject.respond_to?(:random_name)).not_to be_truthy }
  end

  describe '#survey' do
    after(:each) do
      subject.restore_attributes
    end
   
    it do
      subject.survey = nil
      subject.valid?
      expect(subject.errors[:survey].size).to eq(1)
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
    context 'no participant or survey' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'no participant' do
      it { expect { described_class.create! participant: participant }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'no survey' do
      it { expect { described_class.create! survey: survey }.to raise_error ActiveRecord::RecordInvalid }
    end
 
    context 'survey and participant' do
      it do 
        expect { described_class.find_or_create_by! participant: participant, survey: survey }.not_to raise_error
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
    before :each do
      subject.destroy!
    end

    it { expect(Participant.exists?(participant.id)).to be_truthy }

    it { expect(Survey.exists?(survey.id)).to be_truthy }
  end

  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
