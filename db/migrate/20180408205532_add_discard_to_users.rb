# frozen_string_literal: true

require './lib/shared_migration'

# Add soft delete to users table
class AddDiscardToUsers < ActiveRecord::Migration[5.1]
  include SharedMigration
  
  def change
    add_discard table_name: :users
  end
end
