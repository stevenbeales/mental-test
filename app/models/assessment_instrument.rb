# frozen_string_literal: true

# Association class between assessments and instruments
class AssessmentInstrument < ApplicationRecord
  belongs_to :assessment, inverse_of: :assessment_instruments, touch: true
  belongs_to :instrument, inverse_of: :assessment_instruments, touch: true

  validates :assessment, presence: true
  validates :instrument, presence: true

  validates_uniqueness_of :instrument, scope: :assessment
  validates_uniqueness_of :assessment, scope: :instrument

  def to_s
    %(#{assessment} #{instrument})
  end
end

# == Schema Information
#
# Table name: assessment_instruments
#
#  id            :integer          not null, primary key
#  assessment_id :integer          not null
#  instrument_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_assessment_instruments_on_assessment_id  (assessment_id)
#  index_assessment_instruments_on_instrument_id  (instrument_id)
#  index_by_assessment_instrument                 (assessment_id,instrument_id) UNIQUE
#
