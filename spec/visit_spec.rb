# frozen_string_literal: true

require './models/init'

RSpec.describe Visit, type: :model do 
  subject { described_class.find_or_create_by! survey: survey, name: AppConstants::TEST_VISIT, user: user }
  let!(:survey) { Survey.find_or_create_by! name: AppConstants::TEST_SURVEY }
  let!(:user) { User.find_or_create_by! username: AppConstants::TEST_USER }
  let!(:assessment) { Assessment.find_or_create_by! visit: subject }
    
  describe '.create!' do
    context 'without survey and user' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'without user' do
      it { expect { described_class.create! survey: survey }.to raise_error ActiveRecord::RecordInvalid }
    end
  
    context 'without survey' do
      it { expect { described_class.create! user: user }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'with user and survey' do
      it { expect { described_class.create! user: user, survey: survey }.not_to raise_error }
    end
  end

  describe '#to_s' do
    it do
      ur = User.find_or_create_by! username: 'bernie'
      v = described_class.create! user: ur, name: AppConstants::TEST_VISIT, survey: survey
      expect(v.to_s).to eq("bernie #{survey.name} #{v.name}")
    end
  end
 
  describe '#destroy!' do
    it do
      cached_id = assessment.id
      v1 = described_class.find_or_create_by! user: user, name: 'visit 1', survey: survey
      v1.assessments.concat(assessment)
      v1.destroy
      expect { Assessment.find(cached_id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'visits are equal' do
    context 'same user, survey and name' do
      ur = User.create! username: 'user compare'
      sy = Survey.create! name: 'survey compare'
      v1 = described_class.create! user: ur, name: 'visit 1', survey: sy
      v2 = described_class.where(user_id: v1.user.id, name: v1.name, survey_id: v1.survey.id).first
      it { expect(v1).to eq(v2) }
      ur.destroy!
      sy.destroy!
    end
  end
end
