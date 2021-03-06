# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                :integer          not null, primary key
#  instrument_id     :integer          not null
#  name              :string           not null
#  item_type         :string           not null
#  title             :string           not null
#  response_scale_id :integer
#  is_required       :boolean          default(TRUE), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_by_item_name                (name) UNIQUE
#  index_items_on_instrument_id      (instrument_id)
#  index_items_on_response_scale_id  (response_scale_id)
#

# Represents a psychometric item
# Similar to a question with metadata
class Item < ApplicationRecord
  include Discard::Model
  belongs_to :instrument, inverse_of: :items, touch: true
  belongs_to :response_scale, inverse_of: :items, optional: true
  has_many :choices, through: :response_scale
  validates :name, presence: true
  validates :instrument, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..20, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'
  validates :item_type, presence: true
  validates_length_of :item_type, \
                      within: 3..20, \
                      too_long: 'pick a shorter item type', \
                      too_short: 'pick a longer item type'

  def find_choice_by_value(value)
    choices.find_by(response_scale: response_scale, value: value)
  end

  def to_s
    name
  end
end
