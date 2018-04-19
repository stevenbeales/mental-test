# frozen_string_literal: true

# Migration to create instruments table
class CreateInstruments < ActiveRecord::Migration[5.1]
  def change
    create_table :instruments, comment: 'Instruments table' do |t|
      t.string :name, null: false, unique: true, index: true
      t.string :version_number, null: false, default: '1.0'
      t.string :instrument_type, null: false, default: 'json'
      t.jsonb :json_content, null: false, default: '{}'
      t.text :csv_content, null: false, index: true, default: ''
      t.text :instructions, null: false, default: ''
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :instruments, :json_content, using: :gin, name: 'instrument_json_content'
  end
end
