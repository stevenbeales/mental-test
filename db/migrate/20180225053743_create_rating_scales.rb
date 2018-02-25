# frozen_string_literal: true

# Creates table for rating scales
class CreateRatingScales < ActiveRecord::Migration[5.1]
  def change
    create_table :rating_scales do |t|
      t.string :name, null: false
    end
 
    add_index :rating_scales, :name, unique: true
  end
end
