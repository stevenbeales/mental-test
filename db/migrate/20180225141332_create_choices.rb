# frozen_string_literal: true

# Creates table for choices in a rating scale
class CreateChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :choices do |t|
      t.references :rating_scale, null: false
      t.string :value, null: false
      t.integer :score, null: false, default: -1
      t.string :description, null: false
    end

    add_foreign_key :choices, :rating_scales
    add_index :choices, %i[rating_scale_id value], unique: true
  end
end
