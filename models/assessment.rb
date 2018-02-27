# frozen_string_literal: true

# == Schema Information
#
# Table name: assessments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  survey_id  :integer          not null
#  content    :jsonb            not null
#  created_at :datetime         default(2018-02-23 00:00:00 UTC), not null
#  updated_at :datetime         default(2018-02-23 00:00:00 UTC), not null
#

# Model to represent the user taking an instrument/questionnaire within a survey/campaign
class Assessment < ActiveRecord::Base
  # has_paper_trail

  belongs_to :survey, inverse_of: :assessments
  belongs_to :visit, inverse_of: :assessments
 
  has_one :user, through: :visit
  has_many :instruments, through: :assessment_instruments
  has_many :assessment_instruments, inverse_of: :assessment
  has_many :responses, inverse_of: :assessment
  
  validates :survey, presence: true
  validates :visit, presence: true
end
