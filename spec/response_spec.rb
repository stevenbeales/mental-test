# frozen_string_literal: true

require './models/init'

RSpec.describe Response, type: :model do
  subject { described_class.find_or_create_by! assessment: ass, value: 'something' }
  let(:ass) { Assessment.find_or_create_by! visit: vt }
  let!(:sy) { Survey.find_or_create_by! name: AppConstants::TEST_SURVEY }
  let!(:ur) { User.find_or_create_by! username: AppConstants::TEST_USER }
  let!(:vt) { Visit.find_or_create_by! user: ur, name: Faker::Name.prefix, survey: sy }

  describe '.create!' do
    context 'without assessment' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'without a value' do
      it { expect { described_class.create! assessment: ass }.to raise_error ActiveRecord::RecordInvalid }
    end
  
    
    context 'with a value and assessment' do
      it { expect { described_class.find_or_create_by! assessment: ass, value: 'something' }.not_to raise_error }
    end
  end

  describe '#to_s' do
    it { expect(subject.to_s).to eq("#{ass} something") }
  end
end
