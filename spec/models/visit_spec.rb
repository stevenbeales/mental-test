# frozen_string_literal: true

RSpec.describe Visit, type: :model do 
  subject { TestFactory.test_visit }
  let!(:survey) { TestFactory.test_survey }
  let!(:user) { TestFactory.test_user }
  let!(:assessment) { TestFactory.test_assessment }
    
  include_examples 'valid object creation', Visit

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[user survey assessments number visit_date]
    include_examples 'common attributes'
  end

  describe '#number' do
    include_context 'restore attributes'
    include_examples 'number specs'
  end

  describe '#user' do
    include_context 'restore attributes'
    
    it 'is required' do
      subject.user = nil
      subject.valid?
      expect(subject.errors[:user].size).to eq(1)
    end
  end
  
  include_examples 'required attribute', 'visit_date', 2
 
  describe '#visit_date' do
    include_context 'restore attributes'
    
    it 'must be a date' do
      subject.visit_date = '13/13/13'
      subject.valid?
      expect(subject.errors[:visit_date].size).to be > 0
    end
  end
  
  describe '#survey' do
    include_context 'restore attributes'
    
    it 'is required' do
      subject.survey = nil
      subject.valid?
      expect(subject.errors[:survey].size).to eq(1)
    end
  end

  include_examples 'invalid create', 'no survey and user' 

  describe '.create!' do
    context 'no user' do
      it do
        expect { Visit.create! survey: survey }.to raise_error ActiveRecord::RecordInvalid
      end  
    end
  
    context 'no survey' do
      it do
        expect { Visit.find_or_create_by! user: user, survey: survey }.not_to raise_error
      end
    end
  end

  describe '#to_s' do
    it do
      ur = User.find_or_create_by! username: 'bernie'
      v = Visit.find_or_create_by! user: ur, number: 1, survey: survey
      expect(v.to_s).to eq("bernie #{survey.name} #{v.number}")
    end
  end

  describe '#eq' do
    context 'user, survey and name' do
      ur = User.find_or_create_by! username: 'user compare'
      sy = Survey.find_or_create_by! name: 'survey compare'
      begin
        v1 = Visit.create! user: ur, name: 'visit 1', survey: sy
        v2 = Visit.where(user_id: v1.user.id, name: v1.name, 
                         survey_id: v1.survey.id).first
        it { expect(v1.id).to eq(v2.id) }
      ensure
        ur.destroy!
        sy.destroy!
      end
    end
  end

  describe '#destroy!' do
    it 'assessment' do
      cached_id = assessment.id
      v1 = Visit.find_or_create_by! user: user, name: 'visit 1', survey: survey, number: 2
      begin
        v1.assessments.concat(assessment)
      ensure
        assessment.destroy!
        v1.destroy!
        expect { Assessment.find(cached_id) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    it 'assessments' do
      subject.assessments.delete_all
      expect(subject.assessments.count.to_s).to eq '0' 
    end
 
    describe '#assessments' do
      it do
        ass1 = Assessment.create! visit: subject, order_number: 24
        ass2 = Assessment.create! visit: subject, order_number: 2
        begin
          expect { subject.assessments.concat [ass1, ass2] }.to change { subject.assessments.size }.by(2)
        ensure
          subject.assessments.delete_all
        end
      end
    end
  end
end
