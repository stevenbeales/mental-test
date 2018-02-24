# frozen_string_literal: true

# Model to represent a survey/campaign
class Survey < ActiveRecord::Base
  # has_paper_trail

  has_many :assessments, dependent: :destroy
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
 