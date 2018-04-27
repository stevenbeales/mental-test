# frozen_string_literal: true

# Table to represent study events in an arm
class CreateStudyEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :study_events do |t|
      t.string :name, null: false
      t.integer :order, null: false, index: true, default: 1
      t.references :arm, null: false, foreign_key: true, index: true
      t.datetime :event_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :study_events, %i[arm_id name], unique: true, name: 'index_by_arm_name'
    add_index :study_events, :name, unique: true
  end
end
