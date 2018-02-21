# frozen_string_literal: true

# Migration to create results table
# Stores users' responses
class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.references :instrument, null: false, index: true
      t.references :user, null: false, index: true
      t.jsonb :content, null: false, default: '{}'
      t.timestamps null: false, default: Date.today
    end

    add_index :results, :content, using: :gin
    add_foreign_key :results, :instruments
    add_foreign_key :results, :users
  end
end
