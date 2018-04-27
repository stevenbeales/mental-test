# frozen_string_literal: true

RSpec.describe Schedule, type: :model do
  subject { TestFactory.test_schedule }
  let!(:study) { TestFactory.test_study }

  include_examples 'valid object creation', Schedule

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[arms study]
    include_examples 'common attributes'
  end

  include_examples 'required attribute', 'name', 2

  describe '#study' do
    include_context 'restore attributes'

    it do
      subject.study = nil
      subject.valid?
      expect(subject.errors[:study].size).to eq(1)
    end
  end

  include_examples 'invalid create', 'without name or study'

  describe '.create!' do
    context '1 character name' do
      it { expect { Schedule.create! name: 'a', study: study }.to raise_error ActiveRecord::RecordInvalid }
    end

    context '2+ character name and title' do
      it do
        expect { Schedule.find_or_create_by! name: 'as', study: study }.to_not raise_error
        Schedule.find_by(name: 'as', study: study).destroy!
      end
    end

    context 'unique name' do
      it do
        another_object = Schedule.create! name: 'a13', study: study
        begin
          expect { Schedule.create! name: 'a13', study: study }.to raise_error ActiveRecord::RecordInvalid
        ensure
          another_object.destroy!
        end
      end
    end
  end

  include_examples '#to_s', 'name', TestConstants::TEST_SCHEDULE
end
