# frozen_string_literal: true

RSpec.describe InstrumentLoaderJson do
  subject { described_class.instance }
  
  it 'is an instance of InstrumentLoaderJson' do
    expect(subject).to be_an InstrumentLoaderJson
  end
  
  describe '#respond_to?' do
    include_context 'shared attributes'   
    include_examples 'responds', :load
    include_examples 'missing attribute'
  end
end
