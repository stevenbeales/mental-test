# frozen_string_literal: true

RSpec.describe Choice, type: :model do
  subject { TestFactory.test_choice }
  let!(:scale) { TestFactory.test_response_scale }

  it 'is an instance of Choice' do
    expect(subject).to be_a Choice
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
 
  describe '#response_scale' do
    before(:each) do
      @cached_response_scale = subject.response_scale
    end
    after(:each) do
      subject.response_scale = @cached_response_scale
    end
    it do
      subject.response_scale = nil
      subject.valid?
      expect(subject.errors[:response_scale].size).to eq(1)
    end
  end
  
  describe '#value' do
    before(:each) do
      @cached_value = subject.value
    end
    after(:each) do
      subject.value = @cached_value
    end
    it do
      subject.value = nil
      subject.valid?
      expect(subject.errors[:value].size).to eq(1)
    end
  end

  describe '#description' do
    before(:each) do
      @cached_description = subject.description
    end
    after(:each) do
      subject.description = @cached_description
    end
    it do
      subject.description = nil
      subject.valid?
      expect(subject.errors[:description].size).to eq(1)
    end
  end

  describe '.create!' do
    context 'without response scale or descriptionue' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'without response scale' do
      it { expect { described_class.create! value: 'val', description: 'text' }.to raise_error ActiveRecord::RecordInvalid }
    end
    
    it 'with response scale, value and description' do
      expect do
        described_class.find_or_create_by! response_scale: scale, value: 'val', description: 'text' 
      end.not_to raise_error
      c = Choice.find_by response_scale_id: scale.id, value: 'val'
      c.destroy!
    end
  end

  describe '#to_s' do
    it do
      c = subject
      expect(c.to_s).to eq("#{scale} val text") 
    end
  end

  describe '#destroy!' do
    it do
      c = TestFactory.test_choice
      scale.choices.concat(c)
      c.destroy!
      scale.save!
      expect(scale.choices.count.to_s).to eq '0'
    end    
  end

  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
