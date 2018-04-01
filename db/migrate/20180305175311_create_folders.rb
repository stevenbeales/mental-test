# frozen_string_literal: true

require './lib/shared_migration'

# Migration to create folders table
# Folders are used to organize projects
class CreateFolders < ActiveRecord::Migration[5.1]
  include SharedMigration

  def change
    create_name_table table_name: :folders
  end
end
