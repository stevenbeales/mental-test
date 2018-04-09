# frozen_string_literal: true

require './lib/custom_exceptions'

# Methods to DRY out migrations
module SharedMigration
  def create_name_table(table_name:) 
    raise "Missing Table Name: #{table_name}" if table_name.blank?

    create_table table_name do |tname|
      tname.string :name, null: false, index: true, unique: true
      tname.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end

  def add_discard(table_name:)
    raise "Missing Table Name: #{table_name}" if table_name.blank?

    add_column table_name, :discarded_at, :datetime
    add_index table_name, :discarded_at
  end
end
