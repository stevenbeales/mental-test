# frozen_string_literal: true

RSpec.describe InstrumentLoader do
  subject { described_class.instance }
  let!(:instrument) { Instrument.find_by_name(TestConstants::TEST_INSTRUMENT) }

  it 'is an instance of InstrumentLoader' do
    expect(subject).to be_an InstrumentLoader
  end

  describe '#respond_to?' do
    it { expect(subject.respond_to?(:load)).to be_truthy }
   
    it { expect(subject.respond_to?(:random_name)).not_to be_truthy }
  end

  context '#load existing instrument' do
    context 'overwrite false' do
      it do 
        expect { subject.load(instrument: instrument) }.to \
          raise_error(RuntimeError)
      end
    end

    context '#load overwrite true' do
      it do 
        expect(subject.load(instrument: instrument, overwrite: true).name).to \
          eq(instrument.name)
      end
    end
  end

  context 'missing instrument' do
    it do
      expect do
        subject.load(instrument: Instrument.find_by_name('does not exist')) 
      end.to raise_error(RuntimeError)
    end
  end
end
