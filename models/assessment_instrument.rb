# frozen_string_literal: true

# Association class between assessments and instruments
class AssessmentInstrument < ActiveRecord::Base
  belongs_to :assessment
  belongs_to :instrument
  validates :assessment, presence: true
  validates :instrument, presence: true
end
