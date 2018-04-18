# frozen_string_literal: true

# Model to represent study events
class StudyEvent < ApplicationRecord
  belongs_to :arm, inverse_of: :study_events 
  delegate :schedule, to: :arm, allow_nil: true
  delegate :study, to: :schedule, allow_nil: true
  has_many :study_event_instruments
  has_many :instruments, through: :study_event_instruments
    
  validates :arm, presence: true
  validates :name, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..50, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'

 
  def to_s
    "#{arm} #{name}"
  end
end

# == Schema Information
#
# Table name: study_events
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  order      :integer          default(1), not null
#  arm_id     :integer          not null
#  event_date :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_by_arm_name             (arm_id,name) UNIQUE
#  index_study_events_on_arm_id  (arm_id)
#  index_study_events_on_name    (name)
#  index_study_events_on_order   (order)
#
