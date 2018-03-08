# frozen_string_literal: true

require './models/init'

RSpec.describe Assessment, type: :model do
  subject { described_class.find_or_create_by! visit: visit }
  let!(:survey) { Survey.find_or_create_by! name: AppConstants::TEST_SURVEY }
  let!(:user) { User.find_or_create_by! username: AppConstants::TEST_USER }
  let!(:visit) { Visit.find_or_create_by! user: user, name: AppConstants::TEST_VISIT, survey: survey }

  describe '.create!' do
    context 'with no visit' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end
  
    context 'with visit' do
      it { expect { described_class.find_or_create_by! visit: visit }.not_to raise_error }
    end

    context 'with order_number' do
      it { expect(subject.order_number).to be > 0 } 
    end
  end
  
  describe '#user' do
    it 'has user' do
      expect(subject.user).to eq(user) 
    end
  end 

  describe '#survey' do
    it 'has survey' do
      expect(subject.survey).to eq(survey) 
    end
  end 

  describe '#to_s' do
    context 'user survey visit' do
      it do 
        expect(described_class.where(visit: visit).first.to_s).to eq(visit.to_s)
      end
    end
  end

  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
