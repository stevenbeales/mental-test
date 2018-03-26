# frozen_string_literal: true

# Model to represent patient journals
class Journal < ApplicationRecord
  belongs_to :participant, inverse_of: :journal
  has_many :journal_entries, inverse_of: :journal, dependent: :destroy
  validates :participant, presence: true
  validates :name, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..50, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'

  after_initialize :create_entry_for_today
  
  def list_entries(limit: 4)
    entries = journal_entries.order('entry_date DESC').limit(limit)
    entries.join(' ')
  end

  def read_entry(day)
    JournalEntry.where(entry_date: day.beginning_of_day..day.end_of_day)
  end

  def to_s
    name
  end

  private

  def create_entry_for_today
    journal_entries.concat(JournalEntry.new(journal: self)) if new_record?
  end
end
