# frozen_string_literal: true

# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  survey_id  :integer          not null
#  user_id    :integer          not null
#  name       :string
#  number     :integer          default(1), not null
#  visit_date :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_by_survey_user_number  (survey_id,user_id,number) UNIQUE
#  index_visits_on_survey_id    (survey_id)
#  index_visits_on_user_id      (user_id)
#

# Model to represent a user visit or an attempt in a self assessment
class Visit < ApplicationRecord
  
  belongs_to :user, inverse_of: :visits 
  belongs_to :survey, inverse_of: :visits 
  has_many :assessments, dependent: :destroy
  
  validates :user, presence: true
  validates :survey, presence: true
  validates_uniqueness_of :number, scope: %i[survey user] 
  validates :number, presence: true, allow_blank: false
  validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10_000 }

  def to_s
    "#{user} #{survey} #{number}"
  end
end
