# frozen_string_literal: true

# Methods to DRY out migrations
module SharedMigration
  def create_name_table(table_name:)
    raise MissingTableNameException.new table_name if table_name.blank?

    create_table table_name do |tname|
      tname.string :name, null: false
      tname.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
    add_index table_name, :name, unique: true, name: %(index_by_#{table_name})
  end

  def add_discard(table_name:)
    raise MissingTableNameException.new table_name if table_name.blank?

    add_column table_name, :discarded_at, :datetime
    add_index table_name, :discarded_at
  end
end
