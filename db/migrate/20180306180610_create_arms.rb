# frozen_string_literal: true

# Table to represent study arms
class CreateArms < ActiveRecord::Migration[5.1]
  def change
    create_table :arms, comment: 'Arms table' do |t|
      t.string :name, null: false, index: true
      t.integer :number, null: false, index: true, default: 1
      t.references :schedule, null: false, foreign_key: true, index: true 
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :arms, %i[schedule_id id name], unique: true, name: 'index_by_schedule_name'
    add_index :arms, %i[schedule_id id number], unique: true, name: 'index_by_schedule_number'
  end
end
