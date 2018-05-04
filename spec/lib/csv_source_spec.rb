# frozen_string_literal: true

RSpec.describe CsvSource do
  subject { described_class.new './db/fixtures/empty.csv' }
  let!(:missing) { CsvSource.new 'db/fixtures/non-exist.csv' }

  context '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[file arrays]
  end

  it { expect(subject).to be_a CsvSource }

  context 'with empty.csv' do
    it { expect(subject.to_s).to eq '' }
  end

  context 'with missing CSV file' do
    it { expect { missing.read }.to raise_error(FileNotFoundException) }
  end
end
