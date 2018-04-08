# frozen_string_literal: true

require './lib/custom_exceptions'

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
  
  it 'when missing instrument' do
    instrument2 = Instrument.new(name: 'Testing')
    expect do
      subject.load(instrument: instrument2, type: :csv) 
    end.to raise_exception(FileNotFoundException)
  end

  it 'when empty instrument' do
    instrument2 = Instrument.new(name: 'empty')
    expect do
      subject.use_folder(folder: TestConstants::FIXTURES_FOLDER)
      subject.load(instrument: instrument2, type: :csv) 
    end.not_to raise_exception
  end
end
