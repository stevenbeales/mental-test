# frozen_string_literal: true

require './models/init'

RSpec.describe AssessmentInstrument do
  it 'does not save without an instrument and assessment' do
    expect { AssessmentInstrument.create! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'does not save without an instrument' do
    ur = User.create! username: 'random user2'
    sy = Survey.create! name: 'random survey2'
    vt = Visit.create! user: ur, name: 'visit 1', survey: sy
    as = Assessment.create survey: sy, visit: vt
    expect { AssessmentInstrument.create! assessment: as }.to \
      raise_error ActiveRecord::RecordInvalid
  end

  it 'does not save without an assessment' do
    ins = Instrument.find_by_name('Cesd-r')
    expect { AssessmentInstrument.create! instrument: ins }.to \
      raise_error ActiveRecord::RecordInvalid
  end

  it 'does not save with an assessment and instrument' do
    ur = User.create! username: 'random user5'
    sy = Survey.create! name: 'random survey5'
    vt = Visit.create! user: ur, name: 'visit 2', survey: sy
    as = Assessment.create visit: vt, survey: sy
    ins = Instrument.find_by_name('Cesd-r')
    expect { AssessmentInstrument.create! instrument: ins, assessment: as }.not_to raise_error 
  end
end
