# frozen_string_literal: true

# Creates tables for association class between participants and surveys
class CreateSurveyParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :survey_participants do |t|
      t.references :participant, null: false
      t.references :survey, null: false
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :survey_participants, %i[participant_id survey_id], unique: true, name: 'index_by_participant_survey'
    add_foreign_key :survey_participants, :participants
    add_foreign_key :survey_participants, :surveys
  end
end