# frozen_string_literal: true

# == Schema Information
#
# Table name: user_surveys
#
#  id        :integer          not null, primary key
#  participant_id   :integer          not null
#  survey_id :integer          not null
#

# Association class between users and surveys
class SurveyParticipant < ApplicationRecord
  # has_paper_trail

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
