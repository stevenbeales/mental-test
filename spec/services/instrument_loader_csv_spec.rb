# frozen_string_literal: true

RSpec.describe InstrumentLoaderCsv do
  subject { described_class.instance }
  
  it 'is an instance of InstrumentLoaderCsv' do
    expect(subject).to be_an InstrumentLoaderCsv
  end

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'responds', :load
    include_examples 'missing attribute'
  end
end
