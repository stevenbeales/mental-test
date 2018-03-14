# frozen_string_literal: true

RSpec.describe Response, type: :model do
  subject { described_class.find_or_create_by! assessment: ass, value: 'something' }
  let(:ass) { TestFactory.test_assessment }
  let!(:sy) { TestFactory.test_survey }
  let!(:ur) { TestFactory.test_user }
  let!(:vt) { TestFactory.test_visit }
  let!(:choice) { Choice.find_or_create_by! response_scale: scale, value: 'val', description: 'text' }
  let!(:scale) { TestFactory.test_response_scale }
  
  it 'is an instance of response' do
    expect(subject).to be_an Response
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '.create!' do
    context 'without assessment' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

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
    context 'with choice' do
      it do
        subject.choice = choice
        subject.destroy!
        expect(choice).not_to be_nil
      end
    end

    context 'with assessment' do
      it do
        subject.destroy!
        expect(ass).not_to be_nil
      end
    end
  end
    
  describe 'multiple responses' do
    it do
      rep2 = described_class.create_with(score: 2).find_or_create_by!(assessment: ass, value: '2') 
      rep3 = described_class.create_with(score: 5).find_or_create_by!(assessment: ass, value: '3') 
      ass.responses.concat([rep2, rep3])
      expect(subject.assessment.responses.count.to_s).to eq '3'     
    end
  end

  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
