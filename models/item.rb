# frozen_string_literal: true

# == Schema Information

# Table name: items

#  id              :integer          not null, primary key
#  instrument_id   :integer          not null
#  name            :string           not null
#  item_type       :string           not null
#  title           :string           not null
#  response_scale_id :integer
#  is_required     :boolean          default(TRUE), not null
#

# Represents a psychometric item
# Similar to a question with metadata
class Item < ApplicationRecord
  belongs_to :instrument, inverse_of: :items
  belongs_to :response_scale, inverse_of: :items, optional: true
  has_many :choices, through: :response_scale  
  validates :name, presence: true
  validates :instrument, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..20, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'
  
  def find_choice_by_value(value)
    choices.find_by(response_scale: response_scale, value: value)
  end

  def to_s
    name
  end
end
