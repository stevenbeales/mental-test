# frozen_string_literal: true

# Creates table for rating scales
class CreateResponseScales < ActiveRecord::Migration[5.1]
  def change
    create_table :response_scales do |t|
      t.string :name, null: false
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
 
    add_index :response_scales, :name, unique: true
  end
end
