# frozen_string_literal: true

require './models/init'

RSpec.describe Assessment, type: :model do
  subject { described_class.find_or_create_by! visit: visit }
  let!(:survey) { TestFactory.test_survey }
  let!(:user) { TestFactory.test_user }
  let!(:visit) { TestFactory.test_visit }

  describe '.create!' do
    context 'with no visit' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end
  
    context 'with visit' do
      it { expect { described_class.find_or_create_by! visit: visit }.not_to raise_error }
    end

    context 'with default order_number' do
      it { expect(subject.order_number).to be > 0 } 
    end
  end
  
  describe '#user' do
    it do
      expect(subject.user.id).to eq(user.id) 
    end
  end 

  describe '#survey' do
    it do
      expect(subject.survey.id).to eq(survey.id) 
    end
  end 

  describe '#to_s' do
    it do 
      expect(described_class.where(visit: visit).first.to_s).to eq(visit.to_s)
    end
  end

  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
