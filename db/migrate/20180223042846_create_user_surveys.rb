# frozen_string_literal: true

# Creates tables for association class between users and surveys
class CreateUserSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table :user_surveys do |t|
      t.references :user, null: false
      t.references :survey, null: false
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    add_index :user_surveys, %i[user_id survey_id], unique: true, name: 'index_by_user_survey'
    add_foreign_key :user_surveys, :users
    add_foreign_key :user_surveys, :surveys
  end
end
