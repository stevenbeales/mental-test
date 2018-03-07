# frozen_string_literal: true

# Model to represent study events
class StudyEvent < ApplicationRecord
  belongs_to :arm, inverse_of: :study_events 
  delegate :schedule, to: :arm, allow_nil: true
  delegate :study, to: :schedule, allow_nil: true
  
  validates :name, presence: true
  validates :arm, presence: true
  validates :name, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..50, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'

 
  def to_s
    "#{study} #{arm} #{name}"
  end
end
