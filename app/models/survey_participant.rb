# frozen_string_literal: true

# Association class between participants and surveys
class SurveyParticipant < ApplicationRecord
  belongs_to :participant, inverse_of: :survey_participants
  belongs_to :survey, inverse_of: :survey_participants

  validates :participant, presence: true
  validates :survey, presence: true

  validates_uniqueness_of :survey, scope: :participant
  validates_uniqueness_of :participant, scope: :survey
  
  def to_s
    "#{participant} #{survey}"
  end
end
