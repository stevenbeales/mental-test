# frozen_string_literal: true

# Add soft delete to users table
class AddDiscardToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :discarded_at, :datetime
    add_index :users, :discarded_at
  end
end
