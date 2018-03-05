# frozen_string_literal: true

# Model to represent projects in a folder
class Folder < ApplicationRecord
  has_many :projects, inverse_of: :folder
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
