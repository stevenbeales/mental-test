# frozen_string_literal: true

require './models/init'

RSpec.describe Survey do
  subject { described_class.find_or_create_by! name: AppConstants::TEST_SURVEY }

  describe '.create!' do
    it 'without a name' do
      expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'with single character name' do
      expect { described_class.create!(name: 'a') }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'with 2+ character name' do
      expect { described_class.find_or_create_by!(name: 'as') }.not_to raise_error
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
      survey = described_class.find_or_create_by! name: 'Welcome!1'
      expect(survey.to_s).to eq 'Welcome!1'
      survey.destroy!
    end
  end 

  describe '.assessments' do
    it 'have multiple assessments' do
      survey = described_class.find_or_create_by! name: Faker::Name.first_name
      user = User.find_or_create_by! username: Faker::Internet.unique.user_name(5..20)
      vt = Visit.find_or_create_by! user: user, name: 'Visit 27', survey: survey
      assessment = Assessment.find_or_create_by! visit: vt 
      another_assessment = Assessment.create! visit: vt
      survey.visits.concat(vt)
      vt.assessments.concat(assessment)
      vt.assessments.concat(another_assessment)
      expect(survey.assessments.count).to eq(2)  
      survey.destroy!
    end
  end
end
