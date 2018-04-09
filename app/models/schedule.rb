# frozen_string_literal: true

# Model to represent visit schedules
class Schedule < ApplicationRecord
  belongs_to :study, touch: true
  has_many :arms, inverse_of: :schedule

  validates :name, presence: true
  validates :study, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..50, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'
  
  def to_s
    name
  end
end

# == Schema Information
#
# Table name: schedules
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  study_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_schedules_on_name      (name)
#  index_schedules_on_study_id  (study_id)
#
