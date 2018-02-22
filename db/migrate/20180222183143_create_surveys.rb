# frozen_string_literal: true

# Migration to create surveys table
# A survey is a campaign that has assessments  
class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys do |t|
      t.string :name, null: false
      t.references :assessment, null: false, index: true
      t.boolean :is_active, null: false, default: true
      t.integer :max_attempts, null: false, default: 0
      t.timestamps null: false, default: Date.today
    end

    add_foreign_key :surveys, :assessments
  end
end
