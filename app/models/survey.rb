# frozen_string_literal: true

# Model to represent a survey/campaign
class Survey < ApplicationRecord
  audited
  has_many :survey_participants, inverse_of: :survey, dependent: :destroy
  has_many :visits, inverse_of: :survey, dependent: :destroy
  has_many :assessments, through: :visits
  has_many :participants, through: :survey_participants
  
  scope :active, -> { where(is_active: true) }

  validates :name, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..50, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'
  
  def self.list_active_tests
    Survey.active.join(' ')
  end                 

  def self.list_tests
    Survey.all.join(' ')
  end

  def to_s
    name
  end
end

# == Schema Information
#
# Table name: surveys
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  is_active    :boolean          default(TRUE), not null
#  max_attempts :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_by_survey_name  (name) UNIQUE
#
