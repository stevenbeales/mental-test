# frozen_string_literal: true

# == Schema Information
#
# Table name: responses
#
#  id            :integer          not null, primary key
#  assessment_id :integer          not null
#  score         :integer          default(-1), not null
#  value         :string           default(""), not null
#

# Model to represent a response to an item
class Response < ActiveRecord::Base
  belongs_to :assessment, inverse_of: :responses

  validates :assessment, presence: true
  validates :value, presence: true
end
