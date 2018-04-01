# frozen_string_literal: true

require './lib/shared_migration'

# Creates table to hold response scales
class CreateResponseScales < ActiveRecord::Migration[5.1]
  include SharedMigration

  def change
    create_name_table table_name: :response_scales
  end
end
