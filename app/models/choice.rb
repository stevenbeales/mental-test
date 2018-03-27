# frozen_string_literal: true

# == Schema Information

# Table name: choices
#
#  id              :integer          not null, primary key
#  response_scale_id :integer          not null
#  value           :string           not null
#  score           :integer          default(-1), not null
#  description     :string           not null
#

# Model to represent choices in a rating scale
class Choice < ApplicationRecord
  belongs_to :response_scale, inverse_of: :choices
  has_many :responses, inverse_of: :choice

  validates :response_scale, presence: true
  validates :value, presence: true
  validates :description, presence: true
  validates_uniqueness_of :value, scope: :response_scale 
  validates_numericality_of :score, message: 'is not a number'

  def to_s
    "#{response_scale} #{value} #{description}"  
  end
end