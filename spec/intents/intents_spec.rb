# frozen_string_literal: true

RSpec.describe Ralyxa::Skill, type: :request do
  subject { described_class.new(double_request) }
  let!(:double_request) { double('request') }

  it { expect(subject).to be_an Ralyxa::Skill }
end
