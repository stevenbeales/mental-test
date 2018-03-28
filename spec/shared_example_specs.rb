# frozen_string_literal: true

# Note: file cannot be renamed to shared_spec because of rspec bug that double loads 
# shared spec files ending in _spec.rb https://github.com/rspec/rspec-core/issues/82

# Enables testing of attributes and methods common to multiple classes 

RSpec.shared_examples 'common attributes' do
  context 'timestamps' do
    it { expect(attribute?(:updated_at)).to be_truthy }
    it { expect(attribute?(:created_at)).to be_truthy }
  end
  context 'missing attribute' do
    it { expect(subject.respond_to?(:not_attribute)).not_to be_truthy }
  end
end

RSpec.shared_examples 'attribute?' do |attribute|
  context "##{attribute}" do
    it { expect(attribute?(attribute)).to be_truthy }
  end
end

RSpec.shared_examples 'invalid create' do
  it do
    expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid
  end
end

RSpec.shared_examples 'number' do
  it 'is required' do
    subject.number = nil
    subject.valid?
    expect(subject.errors[:number].size).to eq(2)
  end

  it 'is not negative' do
    subject.number = -1
    subject.valid?
    expect(subject.errors[:number].size).to eq(1)
  end

  context 'is < 10001' do
    it do
      subject.number = 10_001
      subject.valid?
      expect(subject.errors[:number].size).to eq(1)
    end

    it 'may equal 10000' do
      subject.number = 10_000
      subject.valid?
      expect(subject.errors[:number].size).to eq(0)
    end
  end

  context 'is positive' do
    it do
      subject.number = 0
      subject.valid?
      expect(subject.errors[:number].size).to eq(1)
    end
  end

  context 'is integer' do
    it do
      subject.number = 1.5
      subject.valid?
      expect(subject.errors[:number].size).to eq(1)
    end
  end
end

RSpec.shared_examples 'valid' do |klass|
  it "is an instance of #{klass}" do
    expect(subject).to be_a klass
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#created_at today' do
    # expect record to be created within the last 
    # 5 minutes to check timestamp works
    it 'is created less than 5 minutes ago' do
      expect(Time.now - subject.created_at).to be < 300
    end
  end
end
