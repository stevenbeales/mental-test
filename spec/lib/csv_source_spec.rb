# frozen_string_literal: true

RSpec.describe CsvSource do
  subject { described_class.new './db/fixtures/empty.csv' }
  let!(:missing) { CsvSource.new 'db/fixtures/non-exist.csv' }

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'responds', :file
    include_examples 'responds', :arrays
  end
  
  it { expect(subject).to be_a CsvSource }

  it { expect(subject.to_s).to eq '' }

  it 'when missing file' do
    expect { missing.read }.to raise_error(FileNotFoundException)
  end
end
