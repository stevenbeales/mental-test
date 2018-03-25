# frozen_string_literal: true

RSpec.describe Visit, type: :model do 
  subject { TestFactory.test_visit }
  let!(:survey) { TestFactory.test_survey }
  let!(:user) { TestFactory.test_user }
  let!(:assessment) { TestFactory.test_assessment }
    
  it 'is an instance of Visit' do
    expect(subject).to be_a Visit
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#respond_to?' do
    context '#user' do
      it { expect(subject.respond_to?(:user)).to be_truthy }
    end
    context '#survey' do
      it { expect(subject.respond_to?(:survey)).to be_truthy }
    end
    context '#assessments' do
      it { expect(subject.respond_to?(:assessments)).to be_truthy }
    end
    context '#number' do
      it { expect(subject.respond_to?(:number)).to be_truthy }
    end
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

  describe '#number' do
    after(:each) do
      subject.restore_attributes
    end
    
    it 'is required and positive' do
      subject.number = nil
      subject.valid?
      expect(subject.errors[:number].size).to eq(2)
    end
 
    it 'must be positive' do
      subject.number = -1
      subject.valid?
      expect(subject.errors[:number].size).to eq(1)
    end
 
    context 'must be < 10001' do
      it do
        subject.number = 10_001
        subject.valid?
        expect(subject.errors[:number].size).to eq(1)
      end

      it do
        subject.number = 10_000
        subject.valid?
        expect(subject.errors[:number].size).to eq(0)
      end
    end

    context 'must be > 0' do
      it do
        subject.number = 0
        subject.valid?
        expect(subject.errors[:number].size).to eq(1)
      end
    end

    context 'must be an integer' do
      it do
        subject.number = 1.5
        subject.valid?
        expect(subject.errors[:number].size).to eq(1)
      end
    end
  end

  describe '#user' do
    after(:each) do
      subject.restore_attributes
    end
    
    it 'is required' do
      subject.user = nil
      subject.valid?
      expect(subject.errors[:user].size).to eq(1)
    end
  end
  
  describe '#survey' do
    after(:each) do
      subject.restore_attributes
    end
    
    it 'is required' do
      subject.survey = nil
      subject.valid?
      expect(subject.errors[:survey].size).to eq(1)
    end
  end

  describe '.create!' do
    context 'no survey and user' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'no user' do
      it { expect { described_class.create! survey: survey }.to raise_error ActiveRecord::RecordInvalid }
    end
  
    context 'no survey' do
      it { expect { described_class.create! user: user }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'with user and survey' do
      it { expect { described_class.find_or_create_by! user: user, survey: survey }.not_to raise_error }
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
      v1 = described_class.create! user: ur, name: 'visit 1', survey: sy
      v2 = described_class.where(user_id: v1.user.id, name: v1.name, survey_id: v1.survey.id).first
      it { expect(v1.id).to eq(v2.id) }
      ur.destroy!
      sy.destroy!
    end
  end

  describe '#destroy!' do
    it 'assessment' do
      cached_id = assessment.id
      v1 = described_class.find_or_create_by! user: user, name: 'visit 1', survey: survey, number: 2
      v1.assessments.concat(assessment)
      assessment.destroy!
      v1.destroy!
      expect { Assessment.find(cached_id) }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'assessments' do
      subject.assessments.each(&:destroy!)
      expect(subject.assessments.count.to_s).to eq '0' 
    end
  end

  describe '#assessments' do
    it do
      ass1 = Assessment.create! visit: subject, order_number: 24
      ass2 = Assessment.create! visit: subject, order_number: 2
      expect { subject.assessments.concat [ass1, ass2] }.to change { subject.assessments.size }.by(2)
      subject.assessments.each(&:destroy!)
    end
  end

 
  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it 'is created less than 5 minutes ago' do
      expect(Time.now - subject.created_at).to be < 300
    end
  end
end
