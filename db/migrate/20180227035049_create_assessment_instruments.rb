# frozen_string_literal: true

# Creates table for association class between assessments and instruments
class CreateAssessmentInstruments < ActiveRecord::Migration[5.1]
  def change
    create_table :assessment_instruments do |t|
      t.references :assessment, null: false
      t.references :instrument, null: false
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :assessment_instruments, %i[assessment_id instrument_id], unique: true
    add_foreign_key :assessment_instruments, :assessments
    add_foreign_key :assessment_instruments, :instruments
  end
end
