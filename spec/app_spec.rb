# frozen_string_literal: true

require_relative '../app'

RSpec.describe App do
  subject { App.new }

  it { expect(subject).to be_a Sinatra::Wrapper }
end
