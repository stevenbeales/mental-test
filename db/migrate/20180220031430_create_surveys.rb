# frozen_string_literal: true

# Migration to create surveys table
# A survey is a campaign that has assessments  
class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys, comment: 'Surveys table' do |t|
      t.string :name, null: false
      t.boolean :is_active, null: false, default: true
      t.integer :max_attempts, null: false, default: 0
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
    
    add_index :surveys, :name, unique: true, name: 'index_by_survey_name'
  end
end
