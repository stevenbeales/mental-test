# frozen_string_literal: true

# Table to represent studies
class CreateStudies < ActiveRecord::Migration[5.1]
  def change
    create_table :studies, comment: 'Studies table' do |t|
      t.string :name, null: false, unique: true, index: true
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
