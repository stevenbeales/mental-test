# frozen_string_literal: true

# Model to represent the user taking an instrument/questionnaire within a survey/campaign
class Assessment < ActiveRecord::Base
  # has_paper_trail

  belongs_to :survey
  belongs_to :user
  has_many :instruments, through: :assessment_instruments
  has_many :assessment_instruments
  
  validates :survey, presence: true
  validates :user, presence: true
end
 