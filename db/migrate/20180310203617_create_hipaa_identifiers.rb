# frozen_string_literal: true

require './lib/shared_migration'

# Creates table for Hipaa Identifiers
class CreateHipaaIdentifiers < ActiveRecord::Migration[5.1]
  include SharedMigration

  def change
    create_name_table table_name: :hipaa_identifiers 
  end
end
