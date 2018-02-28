# frozen_string_literal: true

# == Schema Information

# Table name: assessment_instruments
#
#  id            :integer          not null, primary key
#  assessment_id :integer          not null
#  instrument_id :integer          not null

# Association class between assessments and instruments
class AssessmentInstrument < ApplicationRecord
  # has_paper_trail

  belongs_to :assessment, inverse_of: :assessment_instruments
  belongs_to :instrument, inverse_of: :assessment_instruments

  validates :assessment, presence: true
  validates :instrument, presence: true
end
