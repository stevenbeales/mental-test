# frozen_string_literal: true

RSpec.describe Response, type: :model do
  subject { described_class.find_or_create_by! assessment: ass, value: 'something' }
  let(:ass) { TestFactory.test_assessment }
  let!(:sy) { TestFactory.test_survey }
  let!(:ur) { TestFactory.test_user }
  let!(:vt) { TestFactory.test_visit }
  let!(:choice) { TestFactory.test_choice }
  let!(:scale) { InstrumentTestFactory.test_response_scale }
  
  include_examples 'valid object creation', Response

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'responds', :value   
    include_examples 'responds', :assessment    
    include_examples 'responds', :choice
    include_examples 'common attributes'
  end

  describe '#assessment' do
    include_context 'restore attributes'

    it 'is required' do
      subject.assessment = nil
      subject.valid?
      expect(subject.errors[:assessment].size).to eq(1)
    end
  end
  
  describe '#value' do
    include_context 'restore attributes'

    it 'is required' do
      subject.value = nil
      subject.valid?
      expect(subject.errors[:value].size).to eq(1)
    end
  end

  include_examples 'invalid create', 'without assessment' 
   
  describe '.create!' do
    context 'without value' do
      it { expect { described_class.create! assessment: ass }.to raise_error ActiveRecord::RecordInvalid }
    end
  
    context 'with value and assessment' do
      it { expect { described_class.find_or_create_by!(assessment: ass, value: 'something') }.not_to raise_error }
    end
  end

  describe '#to_s' do
    it { expect(subject.to_s).to eq("#{ass} something") }
  end

  describe '#destroy!' do
    context 'choice' do
      it do
        subject.choice = choice
        subject.destroy!
        expect(choice).not_to be_nil
      end
    end

    context 'assessment' do
      it do
        subject.destroy!
        expect(ass).not_to be_nil
      end
    end
  end
end
