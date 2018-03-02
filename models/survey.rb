# frozen_string_literal: true

# == Schema Information
#
# Table name: surveys
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  is_active    :boolean          default(TRUE), not null
#  max_attempts :integer          default(0), not null
#  created_at   :datetime         default(2018-02-23 00:00:00 UTC), not null
#  updated_at   :datetime         default(2018-02-23 00:00:00 UTC), not null

# Model to represent a survey/campaign
class Survey < ApplicationRecord
  # has_paper_trail

  has_many :user_surveys, inverse_of: :survey, dependent: :destroy
  has_many :visits, inverse_of: :survey, dependent: :destroy
  has_many :assessments, through: :visits
  has_many :users, through: :user_surveys
  
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
