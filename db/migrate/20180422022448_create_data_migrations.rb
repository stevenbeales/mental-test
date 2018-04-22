# frozen_string_literal: true

# Create table to hold non-destructive data migrations
class CreateDataMigrations < ActiveRecord::Migration[5.2]
  def change
    create_table :data_migrations do |t|
      t.string :version
    end
  end
end
