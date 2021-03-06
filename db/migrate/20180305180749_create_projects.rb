# frozen_string_literal: true

# Table to represent projects
# Projects are the development and production phase of a study
class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects, comment: 'Projects table' do |t|
      t.string :name, null: false
      t.references :folder, null: true, optional: true
      t.string :title, null: false
      t.text :purpose, null: true
      t.string :irb_number, null: true
      t.string :grant_number, null: true
      t.string :pi_firstname, null: true
      t.string :pi_lastname, null: true
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
    add_index :projects, :name, unique: true
  end
end
