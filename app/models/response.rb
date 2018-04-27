# frozen_string_literal: true

# == Schema Information
#
# Table name: responses
#
#  id            :integer          not null, primary key
#  assessment_id :integer          not null
#  choice_id     :integer
#  value         :string           default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_responses_on_assessment_id  (assessment_id)
#  index_responses_on_choice_id      (choice_id)
#

# Model to represent a response to an item
class Response < ApplicationRecord
  belongs_to :assessment, inverse_of: :responses
  belongs_to :choice, optional: true

  default_value_for :value, ''
  validates :assessment, presence: true
  validates :value, presence: true

  def to_s
    %(#{assessment} #{value})
  end
end
