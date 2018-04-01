# frozen_string_literal: true

# Association class between participants and studies
class StudyParticipant < ApplicationRecord
  belongs_to :participant, inverse_of: :study_participants
  belongs_to :study, inverse_of: :study_participants
  validates :participant, presence: true
  validates :study, presence: true

  validates_uniqueness_of :study, scope: :participant
  validates_uniqueness_of :participant, scope: :study
  
  def to_s
    "#{participant} #{study}"
  end
end
