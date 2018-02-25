# frozen_string_literal: true

# Model to represent a response to an item
class RatingScale < ActiveRecord::Base
  has_many :choices, inverse_of: :rating_scale
  has_many :items, inverse_of: :rating_scale
  validates :name, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..50, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'
end
