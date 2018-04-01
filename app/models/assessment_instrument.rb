# frozen_string_literal: true

# Association class between assessments and instruments
class AssessmentInstrument < ApplicationRecord
  belongs_to :assessment, inverse_of: :assessment_instruments
  belongs_to :instrument, inverse_of: :assessment_instruments

  validates :assessment, presence: true
  validates :instrument, presence: true

  validates_uniqueness_of :instrument, scope: :assessment
  validates_uniqueness_of :assessment, scope: :instrument
  
  def to_s
    "#{assessment} #{instrument}"
  end
end
