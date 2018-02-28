# frozen_string_literal: true

# Creates table for responses
class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.references :assessment, null: false, index: true
      t.references :choice, null: true, index: true
      t.string :value, null: false, default: ''
      t.timestamps null: false, default: Time.now
    end

    add_foreign_key :responses, :assessments
  end
end
