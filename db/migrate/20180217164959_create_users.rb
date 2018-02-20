# frozen_string_literal: true

# Migration to create users table
# Users are linked to Alexa users via Account Linking
class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :access_token
      t.jsonb :preferences, null: false, default: '{}'
      t.timestamps null: false
    end

    add_index :users, :preferences, using: :gin
    add_index :users, :username, unique: true
  end
end
