# frozen_string_literal: true

RSpec.describe Visit, type: :model do 
  subject { TestFactory.test_visit }
  let!(:survey) { TestFactory.test_survey }
  let!(:user) { TestFactory.test_user }
  let!(:assessment) { TestFactory.test_assessment }
    
  include_examples 'valid object creation', Visit

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'responds', :user
    include_examples 'responds', :survey
    include_examples 'responds', :assessments
    include_examples 'responds', :number
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
        expect do
          described_class.create! survey: survey
        end.to raise_error ActiveRecord::RecordInvalid
      end  
    end
  
    context 'no survey' do
      it do
        expect do
          described_class.create! user: user 
        end.to raise_error ActiveRecord::RecordInvalid 
      end
    end

    context 'with user and survey' do
      it do 
        expect do
          described_class.find_or_create_by! user: user, survey: survey 
        end.not_to raise_error
      end
    end
  end

  describe '#to_s' do
    it do
      ur = User.find_or_create_by! username: 'bernie'
      v = described_class.find_or_create_by! user: ur, number: 1, survey: survey
      expect(v.to_s).to eq("bernie #{survey.name} #{v.number}")
    end
  end

  describe '#eq' do
    context 'user, survey and name' do
      ur = User.find_or_create_by! username: 'user compare'
      sy = Survey.find_or_create_by! name: 'survey compare'
      v1 = described_class.create! user: ur,
                                   name: 'visit 1', 
                                   survey: sy
      v2 = described_class.where(user_id: v1.user.id,
                                 name: v1.name, 
                                 survey_id: v1.survey.id).first
      it { expect(v1.id).to eq(v2.id) }
      ur.destroy!
      sy.destroy!
    end
  end

  describe '#destroy!' do
    it 'assessment' do
      cached_id = assessment.id
      v1 = described_class.find_or_create_by! user: user, 
                                              name: 'visit 1', 
                                              survey: survey, 
                                              number: 2
      v1.assessments.concat(assessment)
      assessment.destroy!
      v1.destroy!
      expect { Assessment.find(cached_id) }.to \
        raise_error(ActiveRecord::RecordNotFound)
    end

    it 'assessments' do
      subject.assessments.delete_all
      expect(subject.assessments.count.to_s).to eq '0' 
    end
 
    describe '#assessments' do
      it do
        ass1 = Assessment.create! visit: subject, 
                                  order_number: 24
        ass2 = Assessment.create! visit: subject, 
                                  order_number: 2
        expect { subject.assessments.concat [ass1, ass2] }.to \
          change { subject.assessments.size }.by(2)
        subject.assessments.delete_all
      end
    end
  end
end
