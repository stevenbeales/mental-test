# frozen_string_literal: true

# Creates table for Hipaa Identifiers
class CreateHipaaIdentifiers < ActiveRecord::Migration[5.1]
  def change
    create_table :hipaa_identifiers do |t|
      t.string :name, null: false, index: true, unique: true
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end 
  end
end
