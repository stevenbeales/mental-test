# frozen_string_literal: true

RSpec.describe CsvSource do
  subject { described_class.new './db/fixtures/empty.csv', {} }
  
  it { expect(subject).to be_a CsvSource }

  it { expect(subject.to_s).to eq '' }
end
