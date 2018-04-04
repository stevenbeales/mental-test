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

# == Schema Information
#
# Table name: survey_participants
#
#  id             :integer          not null, primary key
#  participant_id :integer          not null
#  survey_id      :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_by_participant_survey                  (participant_id,survey_id) UNIQUE
#  index_survey_participants_on_participant_id  (participant_id)
#  index_survey_participants_on_survey_id       (survey_id)
#
