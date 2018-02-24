# frozen_string_literal: true

TEXT_BYTES = 1_073_741_823

# Migration to create versions table for paper_trail auditing framework
class CreateVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :versions do |t|
      t.string   :item_type
      t.integer  :item_id,   null: false
      t.string   :event,     null: false
      t.string   :whodunnit
      t.text     :object, limit: TEXT_BYTES
      t.datetime :created_at
    end
    add_index :versions, %i[item_type item_id]
  end
end
