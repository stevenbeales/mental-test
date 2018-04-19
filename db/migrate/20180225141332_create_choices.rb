# frozen_string_literal: true

# Creates table for choices in a rating scale
class CreateChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :choices, comment: 'Choices table' do |t|
      t.references :response_scale, null: false
      t.string :value, null: false
      t.integer :score, null: false, default: -1
      t.string :description, null: false
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_foreign_key :choices, :response_scales
    add_index :choices, %i[response_scale_id value], unique: true, name: 'index_by_response_scale_value'
  end
end
