# frozen_string_literal: true

# Migration to create instruments table
class CreateInstruments < ActiveRecord::Migration[5.1]
  def change
    create_table :instruments do |t|
      t.string :name, null: false, unique: true, index: true
      t.string :version_number, null: false, default: '1.0'
      t.jsonb :content, null: false, default: '{}'
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :instruments, :content, using: :gin, name: 'instrument_content'
  end
end
