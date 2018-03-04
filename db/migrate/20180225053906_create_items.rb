# frozen_string_literal: true

# Creates table for items/questions in an instrument
class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :instrument, null: false, index: true
      t.string :name, null: false
      t.string :item_type, null: false
      t.string :title, null: false
      t.references :response_scale, null: true, index: true
      t.boolean :is_required, null: false, default: true
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }    
    end
    add_keys_and_indexes
  end

  def add_keys_and_indexes
    add_foreign_key :items, :instruments
    add_foreign_key :items, :response_scales
    add_index :items, :name, unique: true
  end
end
