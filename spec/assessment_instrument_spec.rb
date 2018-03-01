# frozen_string_literal: true

require './models/init'

RSpec.describe AssessmentInstrument, type: :model do
  subject { described_class.find_or_create_by assessment: assess, instrument: instrument }
  
  let!(:instrument) { Instrument.find_by_name(AppConstants::TEST_INSTRUMENT) }
  let!(:survey) { Survey.find_or_create_by name: 'Dorito' }
  let!(:user) { User.create! username: Faker::Internet.unique.user_name(5..20) }
  let!(:visit) { Visit.create! user: user, name: Faker::Name.name, survey: survey }
  let!(:assess) { Assessment.create survey: survey, visit: visit }
  
  describe '#create!' do
    context 'with no instrument or assessment' do
      it { expect { subject.class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'with no instrument' do
      it { expect { subject.class.create! assessment: assess }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'with no assessment' do
      it { expect { subject.class.create! instrument: instrument }.to raise_error ActiveRecord::RecordInvalid }
    end
 
    context 'with assessment and instrument' do
      it do 
        expect { subject.class.find_or_create_by instrument: instrument, assessment: assess }.not_to raise_error
      end
    end
  end

  describe '#destroy!' do
    before :each do
      subject.destroy!
    end

    context 'when instrument is not destroyed' do
      it { expect(Instrument.exists?(instrument.id)).to be_truthy }
    end

    context 'when assessment is not destroyed' do
      it { expect(Assessment.exists?(assess.id)).to be_truthy }
    end
  end
end
