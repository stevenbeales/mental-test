# frozen_string_literal: true

# Creates tables for association class between participants and studies
class CreateStudyParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :study_participants do |t|
      t.references :participant, null: false, foreign_key: true
      t.references :study, null: false, foreign_key: true
      t.string :subject_number, null: true
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :study_participants, %i[participant_id study_id], unique: true, name: 'index_participant_study'
    add_index :study_participants, %i[study_id subject_number], name: 'index_study_subject_number'
  end
end
