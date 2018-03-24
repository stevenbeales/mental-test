# frozen_string_literal: true

RSpec.describe InstrumentLoaderJson do
  subject { described_class.instance }
  
  it 'is an instance of InstrumentLoaderJson' do
    expect(subject).to be_an InstrumentLoaderJson
  end
  
  describe '#respond_to?' do
    it { expect(subject.respond_to?(:load)).to be_truthy }
    
    it { expect(subject.respond_to?(:random_name)).not_to be_truthy }
  end
end
