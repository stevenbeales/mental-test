# frozen_string_literal: true

# Creates table for Survey Participants
class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.string :email, null: false, index: true, unique: true
      t.string :identifier, null: true, index: true, unique: true
      t.references :user, null: true, index: true
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end 
  end
end
