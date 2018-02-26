# frozen_string_literal: true

require './models/init'

RSpec.describe AssessmentInstrument do
  it 'does not save without an instrument and assessment' do
    expect { AssessmentInstrument.create! }.to raise_error ActiveRecord::RecordInvalid
  end

  it 'does not save without an instrument' do
    # ass = Assessment.create
    expect { AssessmentInstrument.create! }.to raise_error ActiveRecord::RecordInvalid
  end
end
