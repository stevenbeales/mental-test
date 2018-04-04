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
  validates :score, numericality: { only_integer: true, message: 'is not a number' }

  def to_s
    "#{assessment} #{name}: #{score}"
  end
end

# == Schema Information
#
# Table name: scores
#
#  id            :integer          not null, primary key
#  assessment_id :integer          not null
#  name          :string           not null
#  score         :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_by_assessment_name       (assessment_id,name) UNIQUE
#  index_scores_on_assessment_id  (assessment_id)
#  index_scores_on_name           (name)
#
