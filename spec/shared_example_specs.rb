# frozen_string_literal: true

# Note: file cannot be renamed to shared_spec because of rspec bug that double loads 
# shared spec files ending in _spec.rb https://github.com/rspec/rspec-core/issues/82

# Tests timestamps existence - common to multiple classes
RSpec.shared_examples 'timestamps?' do
  context 'timestamps' do
    it { expect(responds(:updated_at)).to be_truthy }
    it { expect(responds(:created_at)).to be_truthy }
  end
end

# Tests that a class does not respond to a missing attribute
RSpec.shared_examples 'missing attribute' do
  context 'missing attribute' do
    it { expect(subject.respond_to?(:not_attribute)).not_to be_truthy }
  end
end

# Tests common to multiple classes - existence of timestamps 
# and non-existence of missing attributes
RSpec.shared_examples 'common attributes' do
  include_examples 'timestamps?'
  include_examples 'missing attribute'
end

# Tests if an object responds to method
RSpec.shared_examples 'responds' do |attribute|
  context "##{attribute}" do
    it { expect(responds(attribute)).to be_truthy }
  end
end

RSpec.shared_examples 'respond' do |attributes|
  attributes.each { |a| include_examples 'responds', a }
end

# Tests if an object is invalid with default constructor
RSpec.shared_examples 'invalid create' do |text|
  describe '.create!' do
    context text do 
      it do
        expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end

# Tests object creation - 
#   with missing name 
#   1 character name
#   longer than 1 character
#   duplicate names 
RSpec.shared_examples 'create!_with_name' do |text, dup|
  describe '.create!' do
    context text do 
      it do
        expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid
      end
    end
   
    it '1 character name' do
      expect { described_class.create!(name: 'a') }.to raise_error ActiveRecord::RecordInvalid
    end

    it '2+ character name' do
      expect { described_class.find_or_create_by!(name: 'as') }.not_to raise_error
    end

    it 'with duplicate name' do
      expect { described_class.create!(name: dup) }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end

# Tests numeric values
RSpec.shared_examples 'number specs' do
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

RSpec.shared_examples '#to_s' do |text, comparator|
  describe '#to_s' do
    context text do
      it { expect(subject.to_s).to eq comparator }
    end
  end
end

# Tests for valid object creation
RSpec.shared_examples 'valid object creation' do |klass|
  it "is an instance of #{klass}" do
    expect(subject).to be_a klass
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#created_at today' do
    # expect record to be created within the last 
    # 5 minutes to check timestamp works
    it 'is created less than 5 minutes ago', timecop: :freeze do
      expect(Time.now - subject.created_at).to be < 300
    end
  end
end

RSpec.shared_examples 'discards' do |item|
  before :each do
    item.discard
  end

  context 'does not delete' do
    it do
      expect(item.discarded?).to eq true    
    end

    it do
      expect(item.class.kept.include?(item)).to be_falsey
    end
  end
end
