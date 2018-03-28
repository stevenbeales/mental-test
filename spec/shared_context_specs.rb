# frozen_string_literal: true

# Note: file cannot be renamed to shared_spec because of rspec bug that double loads 
# shared spec files ending in _spec.rb https://github.com/rspec/rspec-core/issues/828

# Enables testing of attributes and methods common to multiple classes 
RSpec.shared_context 'shared attributes', a: :b do
  def responds(attribute) 
    subject.respond_to?(attribute)
  end

  # checks that we have timestamps and a non-existent attribute does not give false positive
  def timestamps?
    subject.respond_to?(:updated_at) && subject.respond_to?(:created_at)
  end
end

RSpec.shared_context 'restore attributes' do
  after(:each) do
    subject.restore_attributes
  end
end

RSpec.shared_context 'destroy subject' do
  before :each do
    subject.destroy!
  end
end
