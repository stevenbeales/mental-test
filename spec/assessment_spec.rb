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

  describe 'multiple assessments' do
    it do
      visit.assessments.each(&:destroy!)
      expect(visit.assessments.count.to_s).to eq '0' 
    end

    it do
      ass1 = described_class.create! visit: visit
      ass2 = described_class.create! visit: visit, order_number: 2
      visit.assessments.concat [ass1, ass2]
      expect(visit.assessments.count.to_s).to eq '2' 
    end
  end
end
