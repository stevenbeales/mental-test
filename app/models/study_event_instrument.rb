# frozen_string_literal: true

# Association class between study events and instruments
class StudyEventInstrument < ApplicationRecord
  belongs_to :study_event, inverse_of: :study_event_instruments
  belongs_to :instrument, inverse_of: :study_event_instruments

  validates :study_event, presence: true
  validates :instrument, presence: true

  validates_uniqueness_of :instrument, scope: :study_event
  validates_uniqueness_of :study_event, scope: :instrument
  
  def to_s
    "#{study_event} #{instrument}"
  end
end

# == Schema Information
#
# Table name: study_event_instruments
#
#  id             :integer          not null, primary key
#  study_event_id :integer          not null
#  instrument_id  :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_by_study_event_instrument                  (study_event_id,instrument_id) UNIQUE
#  index_study_event_instruments_on_instrument_id   (instrument_id)
#  index_study_event_instruments_on_study_event_id  (study_event_id)
#
