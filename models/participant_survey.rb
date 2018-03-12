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
class ParticipantSurvey < ApplicationRecord
  # has_paper_trail

  belongs_to :participant, inverse_of: :participant_surveys
  belongs_to :survey, inverse_of: :participant_surveys

  validates :participant, presence: true
  validates :survey, presence: true

  def to_s
    "#{participant} #{survey}"
  end
end
