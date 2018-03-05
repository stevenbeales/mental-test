# frozen_string_literal: true

# Migration to create folders table
# Folders are used to organize projects
class CreateFolders < ActiveRecord::Migration[5.1]
  def change
    create_table :folders do |t|
      t.string :name, null: false, unique: true, index: true
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
