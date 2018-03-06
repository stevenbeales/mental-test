# frozen_string_literal: true

# Model to represent study arms
class CreateArms < ActiveRecord::Migration[5.1]
  def change
    create_table :arms do |t|
      t.string :name, null: false, index: true
      t.integer :number, null: false, index: true
      t.references :schedule, null: false, foreign_key: true, index: true 
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :arms, %i[schedule_id name], unique: true
    add_index :arms, %i[schedule_id number], unique: true
  end
end
