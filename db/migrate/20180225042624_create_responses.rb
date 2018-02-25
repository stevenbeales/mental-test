# frozen_string_literal: true

# Creates table for responses
class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.references :assessment, null: false, index: true
      t.integer :score, null: false, default: -1
      t.string :value, null: false, default: ''
    end
    add_foreign_key :responses, :assessments
  end
end
