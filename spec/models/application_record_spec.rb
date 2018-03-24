# frozen_string_literal: true

RSpec.describe ApplicationRecord do
  describe 'is an abstract class' do
    it { expect { ApplicationRecord.new }.to raise_error NotImplementedError }
  end
end
