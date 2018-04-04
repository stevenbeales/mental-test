# frozen_string_literal: true

# Model to represent 18 hipaa identifiers
class HipaaIdentifier < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..100, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'

  def to_s
    name
  end
end

# == Schema Information
#
# Table name: hipaa_identifiers
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_hipaa_identifiers_on_name  (name)
#
