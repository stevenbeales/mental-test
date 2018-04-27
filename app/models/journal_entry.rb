# frozen_string_literal: true

# Model to represent patient journals
class JournalEntry < ApplicationRecord
  belongs_to :journal, inverse_of: :journal_entries, touch: true
  default_value_for :entry, ''
  default_value_for :entry_date, Time.now
  validates :entry, exclusion: { in: [nil] } # allow '' but not nil
  validates :entry_date, presence: true
  validates_uniqueness_of :entry_date, scope: :journal
  validates :journal, presence: true
  validates_datetime :entry_date

  def to_s
    %(#{entry_date} #{entry})
  end
end

# == Schema Information
#
# Table name: journal_entries
#
#  id         :integer          not null, primary key
#  journal_id :integer          not null
#  entry_date :datetime         not null
#  entry      :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_journal_entries_on_entry_date  (entry_date)
#  index_journal_entries_on_journal_id  (journal_id)
#
