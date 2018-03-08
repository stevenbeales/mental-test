# frozen_string_literal: true

require './models/init'

RSpec.describe StudyEventInstrument, type: :model do
  subject { described_class.find_or_create_by! study_event: study_event, instrument: instrument }
  let!(:arm) { Arm.find_or_create_by! name: AppConstants::TEST_ARM, schedule: schedule, number: 1 }
  let!(:schedule) { Schedule.find_or_create_by! name: AppConstants::TEST_SCHEDULE, study: study }
  let!(:study) { TestFactory.test_study }
  let!(:instrument) { Instrument.find_by_name(AppConstants::TEST_INSTRUMENT) }
  let!(:study_event) { StudyEvent.find_or_create_by! name: AppConstants::TEST_STUDY_EVENT, arm: arm }
  
  describe '.create!' do
    context 'with no instrument or StudyEvent' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'with no instrument' do
      it { expect { described_class.create! study_event: study_event }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'with no StudyEvent' do
      it { expect { described_class.create! instrument: instrument }.to raise_error ActiveRecord::RecordInvalid }
    end
 
    context 'with StudyEvent and instrument' do
      it do 
        expect { described_class.find_or_create_by instrument: instrument, study_event: study_event }.not_to raise_error
      end
    end
  end

  describe '#destroy!' do
    before :each do
      subject.destroy!
    end

    it { expect(Instrument.exists?(instrument.id)).to be_truthy }
    
    it { expect(StudyEvent.exists?(study_event.id)).to be_truthy }
  end
  
  describe '#to_s' do
    it do 
      expect(subject.class.where(study_event: study_event, instrument: instrument).first.to_s).to \
        eq("#{study_event} #{instrument}")
    end
  end

  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
