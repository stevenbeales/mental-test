# frozen_string_literal: true

# == Schema Information
#
# Table name: study_participants
#
#  id        :integer          not null, primary key
#  participant_id   :integer          not null
#  study_id :integer          not null
#

# Association class between participants and studies
class StudyParticipant < ApplicationRecord
  # has_paper_trail

  belongs_to :participant, inverse_of: :study_participants
  belongs_to :study, inverse_of: :study_participants
  has_one :journal, inverse_of: :study_participant, dependent: :destroy
  validates :participant, presence: true
  validates :study, presence: true

  validates_uniqueness_of :study, scope: :participant
  validates_uniqueness_of :participant, scope: :study
  
  def to_s
    "#{participant} #{study}"
  end
end
