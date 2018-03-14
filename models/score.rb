# frozen_string_literal: true

# Assessment scores and sub scores
class Score < ApplicationRecord
  belongs_to :assessment, inverse_of: :scores 
  delegate :visit, to: :assessment, allow_nil: true
  delegate :survey, to: :visit, allow_nil: true
  delegate :participant, to: :survey, allow_nil: true
  delegate :user, to: :participant, allow_nil: true

  validates :name, presence: true
  validates :assessment, presence: true
  validates_uniqueness_of :name, on: :create, message: 'must be unique', scope: :assessment
  validates_numericality_of :score, message: 'is not a number'

  def to_s
    "#{assessment} #{name}: #{score}"
  end
end
