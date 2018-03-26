# frozen_string_literal: true

require_relative '../app'

RSpec.describe App do
  subject { App.new }

  it { expect(subject).to be_a Sinatra::Wrapper }

  it 'should not allow accessing the home page' do
    get '/'
    expect(last_response).not_to be_ok
  end
end
