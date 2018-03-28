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

RSpec.shared_examples 'valid' do |klass|
  it "is an instance of #{klass}" do
    expect(subject).to be_a klass
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
