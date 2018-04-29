# frozen_string_literal: true

# Creates table for Survey Participants
class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants, comment: 'Participants table' do |t|
      t.string :email, null: false, index: true, default: ''
      t.string :identifier, null: false, index: true, default: ''
      t.references :user, null: true, index: true
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
