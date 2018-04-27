# frozen_string_literal: true

# == Schema Information
#
# Table name: response_scales
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_response_scales_on_name  (name) UNIQUE
#

# Model to represent a response to an item
class ResponseScale < ApplicationRecord
  has_many :choices, inverse_of: :response_scale, dependent: :destroy
  has_many :items, inverse_of: :response_scale
  validates :name, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..50, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'

  def to_s
    name
  end
end
