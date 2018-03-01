# frozen_string_literal: true

require './models/init'

RSpec.describe Survey do
  subject { described_class.find_by_name name: AppConstants::TEST_SURVEY }

  describe '.create!' do
    it 'without a name' do
      expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'with single character name' do
      expect { described_class.create!(name: 'a') }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'with 2+ character name' do
      expect { described_class.create!(name: 'as') }.not_to raise_error
    end
  end

  describe '.list_tests' do
    it 'single string' do
      described_class.find_or_create_by! name: 'Test Survey'
      described_class.find_or_create_by! name: 'Test'
      expect(described_class.list_tests).to include 'Test Survey Test'
    end 
  
    it 'active tests' do
      described_class.find_or_create_by! name: 'Test Survey active'
      described_class.find_or_create_by! name: 'Test inactive', is_active: false
      expect(described_class.list_active_tests).to include 'Test Survey Test Test Survey active'
    end 

    it 'prints .to_s as name' do
      survey = described_class.create! name: 'Welcome!1'
      expect(survey.to_s).to eq 'Welcome!1'
    end
  end 

  describe '.assessments' do
    it 'can have multiple assessments' do
      survey = described_class.create! name: Faker::Name.first_name
      user = User.create! username: Faker::Internet.unique.user_name(5..20)
      vt = Visit.find_or_create_by! user: user, name: 'Visit 27', survey: survey
      assessment = Assessment.create! survey: survey, visit: vt 
      another_assessment = Assessment.create! survey: survey, visit: vt
      survey.assessments.push assessment
      survey.assessments.push another_assessment
      expect(survey.assessments.count).to eq(2)  
      survey.destroy
    end
  end
end
