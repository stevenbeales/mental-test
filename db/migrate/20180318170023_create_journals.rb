# frozen_string_literal: true

# Table to hold patient diary 
class CreateJournals < ActiveRecord::Migration[5.1]
  def change
    create_table :journals, comment: 'Journals table' do |t|
      t.string :name, null: false, unique: true, index: true
      t.references :participant, null: false, foreign_key: true, index: true
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
