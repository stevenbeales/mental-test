# frozen_string_literal: true

# Migration to add tags array to instruments table
class AddTagsToInstrument < ActiveRecord::Migration[5.1]
  def change
    change_table :instruments do |t|
      t.string :tags, array: true, default: '{}'
    end
    add_index :instruments, :tags, using: 'gin', name: 'instrument_tags'
  end
end
