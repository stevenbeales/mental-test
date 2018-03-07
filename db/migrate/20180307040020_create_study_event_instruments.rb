# frozen_string_literal: true

# Creates table for association class between study_events and instruments
class CreateStudyEventInstruments < ActiveRecord::Migration[5.1]
  def change
    create_table :study_event_instruments do |t|
      t.references :study_event, null: false
      t.references :instrument, null: false
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :study_event_instruments, %i[study_event_id instrument_id], \
              unique: true, name: 'index_by_study_event_instrument' 
    add_foreign_key :study_event_instruments, :study_events
    add_foreign_key :study_event_instruments, :instruments
  end
end
