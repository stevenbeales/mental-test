# frozen_string_literal: true

# Migration to create instruments table
class CreateInstruments < ActiveRecord::Migration[5.1]
  def change
    create_table :instruments do |t|
      t.string :name, null: false
      t.string :version_number, null: false, default: '1.0'
      t.jsonb :content, null: false, default: '{}'
      t.timestamps null: false, default: Time.now
    end

    add_index :instruments, :content, using: :gin
    add_index :instruments, :name, unique: true
  end
end
