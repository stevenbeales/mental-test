# frozen_string_literal: true

# Association class between assessments and instruments
class AssessmentInstrument < ActiveRecord::Base
  # has_paper_trail

  belongs_to :assessment
  belongs_to :instrument

  validates :assessment, presence: true
  validates :instrument, presence: true
end
