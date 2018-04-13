# frozen_string_literal: true

RSpec.describe Survey do
  subject { TestFactory.test_survey }

  include_examples 'valid object creation', Survey
    
  describe '#respond_to?' do
    include_context 'shared attributes'   
    include_examples 'respond', %i[survey_participants participants visits]
    include_examples 'respond', %i[assessments is_active name]
    include_examples 'common attributes'
  end
  
  describe '#name' do
    include_context 'restore attributes'
    
    it 'is required' do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].size).to eq(2)
    end
  end

  include_examples 'create!_with_name', 'without name', TestConstants::TEST_SURVEY
  
  describe '.list_tests' do
    it do
      described_class.find_or_create_by! name: 'Test Survey'
      described_class.find_or_create_by! name: 'Test'
      expect(described_class.list_tests).to include 'Test Survey Test'
    end 
  end

  describe '.list_active_tests' do
    it do
      described_class.find_or_create_by! name: 'Test Survey active'
      described_class.find_or_create_by! name: 'Test inactive', is_active: false
      expect(described_class.list_active_tests).to \
        include 'Test Survey Test Test Survey active'
    end 
  end

  include_examples '#to_s', 'name', TestConstants::TEST_SURVEY 

  describe '#destroy!' do
    it 'destroys assessments' do
      survey = described_class.find_or_create_by!(name: '!P@ssword2')
      begin
        user = User.find_or_create_by! username: 'Randomly'
        vt = Visit.find_or_create_by! user: user, name: 'Visit 27', survey: survey
        assessment = Assessment.find_or_create_by! visit: vt 
        another_assessment = Assessment.create! visit: vt, order_number: 2
        survey.visits.concat(vt)
        vt.assessments.concat(assessment)
        vt.assessments.concat(another_assessment)
        expect(survey.assessments.count).to eq(2)  
      ensure
        survey.destroy!
      end
    end
  end
end
