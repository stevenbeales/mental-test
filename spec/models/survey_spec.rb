# frozen_string_literal: true

RSpec.describe Survey do
  subject { TestFactory.test_survey }

  it 'is an instance of Survey' do
    expect(subject).to be_a Survey
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
    
  describe '#respond_to?' do
    context '#name' do
      it { expect(subject.respond_to?(:name)).to be_truthy }
    end
    it { expect(subject.respond_to?(:survey_participants)).to be_truthy }
    it { expect(subject.respond_to?(:participants)).to be_truthy }
    it { expect(subject.respond_to?(:visits)).to be_truthy }
    it { expect(subject.respond_to?(:assessments)).to be_truthy }
    it { expect(subject.respond_to?(:is_active)).to be_truthy }
    context '#created_at' do
      it { expect(subject.respond_to?(:created_at)).to be_truthy }
    end
    context '#updated_at' do
      it { expect(subject.respond_to?(:updated_at)).to be_truthy }
    end 
    context '#not_an_attibute' do
      it { expect(subject.respond_to?(:not_an_attibute)).not_to be_truthy }
    end
  end
  
  describe '#name' do
    after(:each) do
      subject.restore_attributes
    end
    
    it 'is required' do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].size).to eq(2)
    end
  end

  describe '.create!' do
    it 'without name' do
      expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid
    end

    it '1 character name' do
      expect { described_class.create!(name: 'a') }.to raise_error ActiveRecord::RecordInvalid
    end

    it '2+ character name' do
      expect { described_class.find_or_create_by!(name: 'as') }.not_to raise_error
    end

    it 'with duplicate name' do
      expect { Survey.create!(name: TestConstants::TEST_SURVEY) }.to raise_error ActiveRecord::RecordInvalid
    end
  end

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
      expect(described_class.list_active_tests).to include 'Test Survey Test Test Survey active'
    end 
  end

  describe '#to_s' do
    it do
      survey = described_class.find_or_create_by! name: 'Welcome!1'
      expect(survey.to_s).to eq 'Welcome!1'
      survey.destroy!
    end
  end 

  describe '#destroy!' do
    it 'destroys assessments' do
      survey = described_class.find_or_create_by!(name: '!P@ssword2')
      user = User.find_or_create_by! username: 'Randomly'
      vt = Visit.find_or_create_by! user: user, name: 'Visit 27', survey: survey
      assessment = Assessment.find_or_create_by! visit: vt 
      another_assessment = Assessment.create! visit: vt, order_number: 2
      survey.visits.concat(vt)
      vt.assessments.concat(assessment)
      vt.assessments.concat(another_assessment)
      expect(survey.assessments.count).to eq(2)  
      survey.destroy!
    end
  end

  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
