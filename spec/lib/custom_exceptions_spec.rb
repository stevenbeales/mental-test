# frozen_string_literal: true

RSpec.describe FileNotFoundException do
  subject { FileNotFoundException.new 'test' }

  it { expect(subject.to_s).to eq 'File not found: test' }
end

RSpec.describe MissingTableNameException do
  subject { MissingTableNameException.new 'example' }

  it { expect(subject.to_s).to eq 'Missing Table Name: example' }  
end
