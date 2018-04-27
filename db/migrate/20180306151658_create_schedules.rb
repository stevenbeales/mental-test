# frozen_string_literal: true

# Table to represent schedules
class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules, comment: 'Schedules table' do |t|
      t.string :name, null: false
      t.references :study, null: false, foreign_key: true, index: true
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
    add_index :schedules, :name, unique: true
  end
end
