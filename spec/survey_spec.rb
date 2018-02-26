# frozen_string_literal: true

require './models/init'

RSpec.describe Survey do
  describe '.name' do
    it 'cannot save without a name' do
      expect { Survey.create! }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'cannot save with a single character name' do
      expect { Survey.create!(name: 'a') }.to raise_error ActiveRecord::RecordInvalid
    end
  end

  describe '.list_tests' do
    it 'lists all tests in a single string with spaces' do
      Survey.create! name: 'Test Survey'
      Survey.create! name: 'Test'
      expect(Survey.list_tests).to include 'Test Survey Test'
    end 
  
    it 'lists all active tests' do
      Survey.create! name: 'Test Survey active'
      Survey.create! name: 'Test inactive', is_active: false
      expect(Survey.list_active_tests).to include 'Test Survey Test Test Survey active'
    end 
  
  end 
end

RSpec.describe Survey do
  describe '.assessments' do
    it 'can have multiple assessments' do
      survey = Survey.create! name: 'Another Test Survey '
      user = User.create! username: 'Marie'
      assessment = Assessment.create! survey: survey, user: user 
      another_assessment = Assessment.create! survey: survey, user: user
      survey.assessments.push assessment
      survey.assessments.push another_assessment
      expect(survey.assessments.count).to eq(2)  
      survey.destroy
    end
  end
end
