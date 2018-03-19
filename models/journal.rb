# frozen_string_literal: true

# Model to represent patient journals
class Journal < ApplicationRecord
  belongs_to :study_participant, inverse_of: :journal
  has_many :journal_entries
  validates :study_participant, presence: true
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
