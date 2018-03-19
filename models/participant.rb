# frozen_string_literal: true

# Model to represent survey participants
class Participant < ApplicationRecord
  belongs_to :user, optional: true
  validates_email_format_of :email, message: 'is not a valid email'
  has_many :survey_participants, inverse_of: :participant, dependent: :destroy
  has_many :surveys, through: :survey_participants
  has_many :study_participants, inverse_of: :participant, dependent: :destroy
  has_many :studies, through: :study_participants
  
  def to_s
    "#{identifier} #{email}".strip
  end
end
