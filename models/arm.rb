# frozen_string_literal: true

# Model to represent a study arm
class Arm < ApplicationRecord
  belongs_to :schedule, inverse_of: :arms 
  delegate :study, to: :schedule, allow_nil: true
  validates :name, presence: true
  validates :schedule, presence: true
  validates_uniqueness_of :number, scope: %i[schedule] 
  validates :number, presence: true, allow_blank: false
  validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10_000 }

  before_validation :add_name_if_missing

  def to_s
    "#{study} #{schedule} #{name} #{number}"
  end

  private

  def add_name_if_missing
    self.name ||= 'arm ' + number.to_s
  end
end