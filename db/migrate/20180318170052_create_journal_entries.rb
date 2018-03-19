# frozen_string_literal: true

# Table to hold patient diary entries
class CreateJournalEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :journal_entries do |t|
      t.references :journal, null: false, foreign_key: true, index: true
      t.datetime :entry_date, null: false, index: true, default: -> { 'CURRENT_TIMESTAMP' }
      t.text :entry, null: false, default: ''  
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
