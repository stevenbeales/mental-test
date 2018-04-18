# frozen_string_literal: true

RSpec.describe Assessment, type: :model do
  subject { TestFactory.test_assessment }
  let!(:survey) { TestFactory.test_survey }
  let!(:user) { TestFactory.test_user }
  let!(:visit) { TestFactory.test_visit }
  let!(:instrument) { InstrumentTestFactory.test_instrument }
  
  include_examples 'valid object creation', described_class
  
  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[visit survey user order_number]
    include_examples 'respond', %i[assessment_instruments instruments responses scores]
    include_examples 'common attributes'
  end

  describe '#visit' do
    include_context 'restore attributes'

    it 'is required' do
      subject.visit = nil
      subject.valid?
      expect(subject.errors[:visit].size).to eq(1)
    end
  end

  describe '#order_number' do
    include_context 'restore attributes'
    include_examples 'number specs', 'order_number'
  end
  
  include_examples 'required attribute', 'order_number', 2
  include_examples 'default attribute', 'order_number', 1
  
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

  include_examples 'invalid create', 'with no visit' 
  
  describe '.create!' do
    context 'with visit' do
      it { expect { Assessment.find_or_create_by! visit: visit }.not_to raise_error }
    end

    context 'with default order_number' do
      it { expect(subject.order_number).to be > 0 } 
    end
  end
  
  describe '#user' do
    it { expect(subject.user.id).to eq(user.id) }
  end 

  describe '#survey' do
    it { expect(subject.survey.id).to eq(survey.id) }
  end 

  describe '#responses' do
    it do
      rep2 = Response.find_or_create_by! assessment: subject, value: '2' 
      rep3 = Response.find_or_create_by! assessment: subject, value: '3' 
      subject.responses.concat([rep2, rep3])
      expect(subject.responses.count).to eq(2)     
    end
  end

  describe '#to_s' do
    it { expect(Assessment.where(visit: visit).first.to_s).to eq(visit.to_s) }
  end

  describe '#order_number' do
    it do
      user2 = User.find_or_create_by! username: 'timmy'
      test_visit2 = Visit.find_or_create_by! name: TestConstants::TEST_VISIT, 
                                             survey: survey, user: user2
      Assessment.find_or_create_by! visit: test_visit2, order_number: 1
      assessment2 = Assessment.find_or_create_by! visit: test_visit2, order_number: 2
      assessment2.order_number = 1
      expect { assessment2.save! }.to raise_error(ActiveRecord::RecordNotUnique) 
    end
  end

  describe '#destroy!' do
    it do
      user2 = User.find_or_create_by! username: 'timmy'
      test_visit2 = Visit.find_or_create_by! name: TestConstants::TEST_VISIT, 
                                             survey: survey, user: user2
      assessment2 = Assessment.find_or_create_by! visit: test_visit2
      begin
        visit2 = assessment2.visit
      ensure
        assessment2.destroy!
        expect(Visit.exists?(visit2.id)).to be_truthy
      end 
    end
  end
end
