# frozen_string_literal: true

# Model to represent projects
class Project < ApplicationRecord
  has_one :folder, inverse_of: :projects
  validates :name, presence: true
  validates :title, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..50, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'

  def to_s
    name
  end
end