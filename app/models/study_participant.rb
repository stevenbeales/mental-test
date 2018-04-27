# frozen_string_literal: true

# Association class between participants and studies
class StudyParticipant < ApplicationRecord
  belongs_to :participant, inverse_of: :study_participants, touch: true
  belongs_to :study, inverse_of: :study_participants, touch: true
  validates :participant, presence: true
  validates :study, presence: true

  validates_uniqueness_of :study, scope: :participant
  validates_uniqueness_of :participant, scope: :study

  def to_s
    "#{participant} #{study}"
  end
end

# == Schema Information
#
# Table name: study_participants
#
#  id             :integer          not null, primary key
#  participant_id :integer          not null
#  study_id       :integer          not null
#  subject_number :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_participant_study                     (participant_id,study_id) UNIQUE
#  index_study_participants_on_participant_id  (participant_id)
#  index_study_participants_on_study_id        (study_id)
#  index_study_subject_number                  (study_id, subject_number)
#
