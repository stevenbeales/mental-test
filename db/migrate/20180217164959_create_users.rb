# frozen_string_literal: true

# Migration to create users table
# Users are linked to Alexa users via Account Linking
class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :firstname, null: true
      t.string :lastname, null: true
      t.text :access_token, null: false, default: ''
      t.jsonb :preferences, null: false, default: '{}'
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_indexes_and_keys
  end

  def add_indexes_and_keys
    add_index :users, :preferences, using: :gin, name: 'preferences'
    add_index :users, :username, unique: true, name: 'username'
  end
end
