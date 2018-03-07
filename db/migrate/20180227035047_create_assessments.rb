# frozen_string_literal: true

# Migration to create assessments table
# Stores users' assessments/results
class CreateAssessments < ActiveRecord::Migration[5.1]
  def change
    create_table :assessments do |t|
      t.references :visit, null: false, index: true
      t.integer :order_number, null: false, default: 1
      t.jsonb :content, null: false, default: '{}'
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :assessments, :content, using: :gin, name: 'assessment_content'
    add_index :assessments, %i[visit_id order_number], unique: true, name: 'index_by_visit_order_number'
    add_foreign_key :assessments, :visits
  end
end
