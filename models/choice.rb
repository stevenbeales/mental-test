# frozen_string_literal: true

# == Schema Information

# Table name: choices
#
#  id              :integer          not null, primary key
#  rating_scale_id :integer          not null
#  value           :string           not null
#  score           :integer          default(-1), not null
#  description     :string           not null
#

# Model to represent choices in a rating scale
class Choice < ActiveRecord::Base
  belongs_to :rating_scale, inverse_of: :choices
  
  validates :rating_scale, presence: true
  validates_uniqueness_of :value, scope: :rating_scale 
end
