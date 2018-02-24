# frozen_string_literal: true

# Migration to create assessments table
# Stores users' assessments/results
class CreateAssessments < ActiveRecord::Migration[5.1]
  def change
    create_table :assessments do |t|
      t.references :user, null: false, index: true
      t.references :survey, null: false, index: true
      t.jsonb :content, null: false, default: '{}'
      t.timestamps null: false, default: Date.today
    end

    add_index :assessments, :content, using: :gin
    add_foreign_key :assessments, :surveys
    add_foreign_key :assessments, :users
  end
end
