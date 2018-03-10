# frozen_string_literal: true

# Add status to projects
class AddStatusToProject < ActiveRecord::Migration[5.1]
  def change
    change_table :projects do |t|
      t.column :status, :integer, default: 0
    end
  end
end
