# frozen_string_literal: true

# Add instructions column to instruments table
class AddInstructionsToInstrument < ActiveRecord::Migration[5.1]
  def change
    change_table :instruments do |t|
      t.column :instructions, :text, default: ''
    end
  end
end
