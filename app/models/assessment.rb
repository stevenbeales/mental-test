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

# == Schema Information
#
# Table name: assessments
#
#  id           :integer          not null, primary key
#  visit_id     :integer          not null
#  order_number :integer          default(1), not null
#  content      :jsonb            not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  assessment_content             (content)
#  index_assessments_on_visit_id  (visit_id)
#  index_by_visit_order_number    (visit_id,order_number) UNIQUE
#
