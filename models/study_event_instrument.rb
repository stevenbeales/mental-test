# frozen_string_literal: true

# == Schema Information

# Table name: study_event_instruments
#
#  id            :integer          not null, primary key
#  study_event_id :integer          not null
#  instrument_id :integer          not null

# Association class between study events and instruments
class StudyEventInstrument < ApplicationRecord
  # has_paper_trail

  belongs_to :study_event, inverse_of: :study_event_instruments
  belongs_to :instrument, inverse_of: :study_event_instruments

  validates :study_event, presence: true
  validates :instrument, presence: true

  def to_s
    "#{study_event} #{instrument}"
  end
end
