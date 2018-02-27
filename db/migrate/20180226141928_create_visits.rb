# frozen_string_literal: true

# Creates table for visits
class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.references :user, null: false, index: true
      t.string :name, null: false, default: Time.now
      t.datetime :visit_date, null: false, default: Time.now
      t.timestamps null: false, default: Time.now
    end
  end
end
