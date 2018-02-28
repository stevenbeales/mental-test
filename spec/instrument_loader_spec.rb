# frozen_string_literal: true

RSpec.describe InstrumentLoader do
  it 'must not overwrite an existing instrument unless overwrite is true' do
    i = InstrumentLoader.instance
    expect { i.load(instrument: Instrument.find_by_name(AppConstants::TEST_INSTRUMENT)) }.to \
      raise_error(RuntimeError)
  end
end
