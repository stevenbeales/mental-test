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
