# frozen_string_literal: true

# Model to represent projects
class Project < ApplicationRecord
  enum status: %i[development production inactive archived]

  belongs_to :folder, inverse_of: :projects, optional: true

  scope :active, -> { where(status: [:production]) }

  validates :name, presence: true
  validates :title, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..50, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'
  
  def self.list_active_projects
    Project.active.join(' ')
  end                 

  def to_s
    name
  end
end
