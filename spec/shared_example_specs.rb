# frozen_string_literal: true

# Note: file cannot be renamed to shared_spec because of rspec bug that double loads 
# shared spec files ending in _spec.rb https://github.com/rspec/rspec-core/issues/82

# Enables testing of attributes and methods common to multiple classes 

RSpec.shared_examples 'common attributes' do
  context 'common attributes' do
    it { expect(timestamps?).to be_truthy }
  end 
end

RSpec.shared_examples 'name' do
  context '#name' do
    it { expect(attribute?(:name)).to be_truthy }
  end
end

RSpec.shared_examples 'attribute?' do |attribute|
  context "##{attribute}" do
    it { expect(attribute?(attribute)).to be_truthy }
  end
end
