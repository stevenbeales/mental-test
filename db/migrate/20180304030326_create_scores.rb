# frozen_string_literal: true

# Migration to add assessment scores table
class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.references :assessment, null: false, index: true
      t.string :name, null: false, index: true
      t.integer :score, null: false, default: 0
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :scores, %i[assessment_id name], unique: true, name: 'index_by_assessment_name'
  end
end
