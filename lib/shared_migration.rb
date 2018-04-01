# frozen_string_literal: true

# Methods to DRY out migrations
module SharedMigration
  def create_name_table(table_name:) 
    raise "Missing Table Name: #{table_name}" if table_name.blank?

    create_table table_name do |t|
      t.string :name, null: false, index: true, unique: true
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
