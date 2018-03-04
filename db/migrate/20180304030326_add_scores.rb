# frozen_string_literal: true

# Migration to add assessment scores table
class AddScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.references :assessment, null: false
      t.string :name, null: false, index: true
      t.integer :score, null: false, default: 0
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_foreign_key :scores, :assessments
    add_index :scores, %i[assessment_id name], unique: true
  end
end
