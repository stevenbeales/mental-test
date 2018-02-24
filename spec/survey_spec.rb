# frozen_string_literal: true

require './models/init'

RSpec.describe Survey do
  describe '.name' do
    it 'cannot save without a name' do
      expect { Survey.create! }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'cannot save with a single character name' do
      expect { Survey.create!(name: 'a') }.to raise_error ActiveRecord::RecordInvalid
    end
  end

  describe '.list_tests' do
    it 'lists all tests in a single string with spaces' do
      Survey.create! name: 'Test Survey'
      Survey.create! name: 'Test'
      expect(Survey.list_tests).to eq 'Test Survey Test'
    end 
  end 
end
