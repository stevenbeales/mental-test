# frozen_string_literal: true

# Assessment scores and sub scores
class Score < ApplicationRecord
  belongs_to :assessment, inverse_of: :scores 
  has_one :visit, through: :assessment
  has_one :suvey, through: :visit
  has_one :user, through: :visit

  validates :name, presence: true
  validates_uniqueness_of :name, on: :create, message: 'must be unique', scope: :assessment
  validates_numericality_of :score, message: 'is not a number'

  def to_s
    "#{assessment} #{name}: #{score}"
  end
end
