# frozen_string_literal: true

# Creates table for visits
class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.references :user, null: false
      t.references :survey, null: false
      t.string :name, null: false, default: Time.now
      t.datetime :visit_date, null: false, default: Time.now
      t.timestamps null: false, default: Time.now
    end
 
    add_foreign_key :visits, :users
    add_foreign_key :visits, :surveys
    add_index :visits, %i[user_id name], unique: true
  end
end
