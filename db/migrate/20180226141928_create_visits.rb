# frozen_string_literal: true

# Creates table for visits
class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.references :survey, null: false, index: true
      t.references :user, null: false, index: true
      t.string :name, null: true
      t.integer :number, null: false, default: 1
      t.datetime :visit_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_foreign_key :visits, :users
    add_foreign_key :visits, :surveys
    add_index :visits, %i[survey_id user_id number], unique: true
  end
end
