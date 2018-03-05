# frozen_string_literal: true

# Model to represent projects 
# Projects are the development and production phase of a study
class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false, unique: true, index: true
      t.references :folder, null: true, optional: true
      t.string :title, null: false
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
