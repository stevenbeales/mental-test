# frozen_string_literal: true

# Model to represent the user taking an instrument/questionnaire within a survey/campaign
class Assessment < ApplicationRecord
  belongs_to :visit, inverse_of: :assessments
  has_one :survey, through: :visit
  has_one :user, through: :visit
  has_many :assessment_instruments, inverse_of: :assessment, dependent: :destroy 
  has_many :instruments, through: :assessment_instruments
  has_many :responses, inverse_of: :assessment, dependent: :destroy
  has_many :scores, inverse_of: :assessment, dependent: :destroy
  
  validates :visit, presence: true
  validates :order_number, presence: true

  before_destroy :destroy_scores

  def to_s
    visit.to_s
  end

  private

  def destroy_scores
    scores.each(&:destroy!)
  end
end
