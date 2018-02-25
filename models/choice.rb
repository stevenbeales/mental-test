# frozen_string_literal: true

# Model to represent choices in a rating scale
class Choice < ActiveRecord::Base
  belongs_to :rating_scale, inverse_of: :choices
  
  validates :rating_scale, presence: true
  validates_uniqueness_of :value, scope: :rating_scale 
end
