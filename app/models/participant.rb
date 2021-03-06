# frozen_string_literal: true

# Model to represent survey participants
class Participant < ApplicationRecord
  belongs_to :user, optional: true
  validates :email, 'valid_email_2/email': true, exclusion: { in: [nil] } # allow '' but not nil
  validates :identifier, exclusion: { in: [nil] } # allow '' but not nil
  default_value_for :email, ''
  default_value_for :identifier, ''
  has_one :journal, inverse_of: :participant, dependent: :destroy
  has_many :survey_participants, inverse_of: :participant, dependent: :destroy
  has_many :surveys, through: :survey_participants
  has_many :study_participants, inverse_of: :participant, dependent: :destroy
  has_many :studies, through: :study_participants
  validates :journal, presence: true
  validates_uniqueness_of :email, allow_blank: true
  validates_uniqueness_of :identifier, allow_blank: true

  after_initialize :create_journal

  def to_s
    %(#{identifier} #{email}).strip
  end

  private

  def create_journal
    self.journal ||= Journal.new(participant: self, name: Time.now.to_s) if new_record?
  end
end

# == Schema Information
#
# Table name: participants
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  identifier :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_participants_on_email       (email)
#  index_participants_on_identifier  (identifier)
#  index_participants_on_user_id     (user_id)
#
