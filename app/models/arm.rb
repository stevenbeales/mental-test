# frozen_string_literal: true

# Model to represent a study arm
class Arm < ApplicationRecord
  belongs_to :schedule, inverse_of: :arms 
  delegate :study, to: :schedule, allow_nil: true
  has_many :study_events, dependent: :destroy
  
  validates :name, presence: true
  validates :schedule, presence: true
  validates_uniqueness_of :number, scope: %i[schedule name] 
  validates :number, presence: true, allow_blank: false
  validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10_000 }

  after_initialize :set_default_number
  before_validation :add_name_if_missing

  def to_s
    "#{study} #{schedule} #{name} #{number}"
  end

  private

  def add_name_if_missing
    self.name ||= 'arm ' + number.to_s
  end

  def set_default_number
    self.number ||= 1
  end
end

# == Schema Information
#
# Table name: arms
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  number      :integer          not null
#  schedule_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_arms_on_name         (name)
#  index_arms_on_number       (number)
#  index_arms_on_schedule_id  (schedule_id)
#  index_by_schedule_name     (schedule_id,id,name) UNIQUE
#  index_by_schedule_number   (schedule_id,id,number) UNIQUE
#
