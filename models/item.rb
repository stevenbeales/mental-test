# frozen_string_literal: true

# Represents a psychometric item
# Similar to a question with metadata
class Item < ActiveRecord::Base
  belongs_to :instrument, inverse_of: :items
  belongs_to :rating_scale, inverse_of: :items
  has_many :choices, through: :rating_scale  
  validates :name, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..20, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'
  
  def find_choice_by_value(value)
    choices.find_by_rating_scale_id_and_value(rating_scale.id, value)
  end

  def to_s
    name
  end
end
