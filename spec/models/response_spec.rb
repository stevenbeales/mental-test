# frozen_string_literal: true

RSpec.describe Response, type: :model do
  subject { described_class.find_or_create_by! assessment: ass, value: 'something' }
  let(:ass) { TestFactory.test_assessment }
  let!(:sy) { TestFactory.test_survey }
  let!(:ur) { TestFactory.test_user }
  let!(:vt) { TestFactory.test_visit }
  let!(:choice) { TestFactory.test_choice }
  let!(:scale) { InstrumentTestFactory.test_response_scale }
  
  it 'is an instance of Response' do
    expect(subject).to be_an Response
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#respond_to?' do
    it { expect(subject.respond_to?(:value)).to be_truthy }
    it { expect(subject.respond_to?(:assessment)).to be_truthy }
    it { expect(subject.respond_to?(:choice)).to be_truthy }
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
    
  describe '#created_at today' do
    # expect record to be created within the last 
    # 5 minutes to check timestamp works
    it 'is created less than 5 minutes ago' do
      expect(Time.now - subject.created_at).to be < 300
    end
  end
end
