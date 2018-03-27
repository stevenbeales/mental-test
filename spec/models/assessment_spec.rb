# frozen_string_literal: true

RSpec.describe Assessment, type: :model do
  subject { TestFactory.test_assessment }
  let!(:survey) { TestFactory.test_survey }
  let!(:user) { TestFactory.test_user }
  let!(:visit) { TestFactory.test_visit }
  let!(:assessment2) { TestFactory.test_assessment2 }
  let!(:instrument) { InstrumentTestFactory.test_instrument }
  let!(:assessment_from_db) { Assessment.find_or_create_by! visit: visit }
   
  it 'is an instance of Assessment' do
    expect(subject).to be_an Assessment
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  
  describe '#respond_to?' do
    include_context 'shared attributes'
    context '#visit' do
      it { expect(subject.respond_to?(:visit)).to be_truthy }
    end
    context '#survey' do
      it { expect(subject.respond_to?(:survey)).to be_truthy }
    end
    context '#user' do
      it { expect(subject.respond_to?(:user)).to be_truthy }
    end
    context '#order_number' do
      it { expect(subject.respond_to?(:order_number)).to be_truthy }
    end
    context '#assessment_instruments' do
      it { expect(subject.respond_to?(:assessment_instruments)).to be_truthy }
    end
    context '#instruments' do
      it { expect(subject.respond_to?(:instruments)).to be_truthy }
    end
    context '#responses' do
      it { expect(subject.respond_to?(:responses)).to be_truthy }
    end 
    context '#scores' do
      it { expect(subject.respond_to?(:scores)).to be_truthy }
    end
    context 'common attributes' do
      it { expect(timestamps?).to be_truthy }
    end 
  end

  describe '#visit' do
    after(:each) do
      subject.restore_attributes
    end

    it 'is required' do
      subject.visit = nil
      subject.valid?
      expect(subject.errors[:visit].size).to eq(1)
    end
  end
  
  describe '#order_number' do
    after(:each) do
      subject.restore_attributes
    end
    
    it 'is required' do
      subject.order_number = nil
      subject.valid?
      expect(subject.errors[:order_number].size).to eq(1)
    end
  end

  describe '#assessment_instruments' do
    it do
      expect(subject.assessment_instruments.size).to eq 0
    end
  end
  
  describe '#instruments' do
    it do
      expect(subject.instruments.index(instrument)).to be_nil
    end
  end

  describe '.create!' do
    context 'with no visit' do
      it do 
        expect { described_class.create! }.to raise_error \
          ActiveRecord::RecordInvalid
      end
    end
  
    context 'with visit' do
      it do
        expect { described_class.find_or_create_by! visit: visit }.not_to \
          raise_error
      end
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

  describe '#responses' do
    it do
      rep2 = Response.create_with(score: 2)
                     .find_or_create_by! assessment: subject, 
                                         value: '2' 
      rep3 = Response.create_with(score: 5)
                     .find_or_create_by! assessment: subject, 
                                         value: '3' 
      subject.responses.concat([rep2, rep3])
      expect(subject.responses.count).to eq(2)     
    end
  end

  describe '#to_s' do
    it do 
      expect(described_class.where(visit: visit).first.to_s).to eq(visit.to_s)
    end
  end

  describe '#created_at today' do
    # expect record to be created within the last 
    # 5 minutes to check timestamp works
    it 'is created less than 5 minutes ago' do
      expect(Time.now - subject.created_at).to be < 300
    end
  end

  describe '#destroy!' do
    it do
      vis = assessment2.visit
      assessment2.destroy!
      expect(Visit.exists?(vis.id)).to be_truthy 
    end
  end
end
