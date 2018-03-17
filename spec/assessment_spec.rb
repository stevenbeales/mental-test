# frozen_string_literal: true

RSpec.describe Assessment, type: :model do
  subject { TestFactory.test_assessment }
  let!(:survey) { TestFactory.test_survey }
  let!(:user) { TestFactory.test_user }
  let!(:visit) { TestFactory.test_visit }
  let!(:assessment2) { TestFactory.test_assessment2 }

  it 'is an instance of Assessment' do
    expect(subject).to be_an Assessment
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#visit' do
    before(:each) do
      @cached_visit = subject.visit
    end
    after(:each) do
      subject.visit = @cached_visit
    end
    it do
      subject.visit = nil
      subject.valid?
      expect(subject.errors[:visit].size).to eq(1)
    end
  end
  
  describe '#order_number' do
    before(:each) do
      @cached_order_number = subject.order_number
    end
    after(:each) do
      subject.order_number = @cached_order_number
    end
    it do
      subject.order_number = nil
      subject.valid?
      expect(subject.errors[:order_number].size).to eq(1)
    end
  end
  
  describe '.create!' do
    context 'with no visit' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end
  
    context 'with visit' do
      it { expect { described_class.find_or_create_by! visit: visit }.not_to raise_error }
    end

    context 'with default order_number' do
      it { expect(subject.order_number).to be > 0 } 
    end
  end
  
  describe '#user' do
    it do
      expect(subject.user.id).to eq(user.id) 
    end
  end 

  describe '#survey' do
    it do
      expect(subject.survey.id).to eq(survey.id) 
    end
  end 

  describe '#to_s' do
    it do 
      expect(described_class.where(visit: visit).first.to_s).to eq(visit.to_s)
    end
  end

  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end

  describe '#destroy!' do
    it do
      vis = assessment2.visit
      assessment2.destroy!
      expect(Visit.exists?(vis.id)).to be_truthy 
    end
  end
end
