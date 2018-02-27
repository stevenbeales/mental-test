# frozen_string_literal: true

# add survey foreign key to visits table
class AddSurveyReferenceToVisit < ActiveRecord::Migration[5.1]
  def change
    add_reference(:visits, :survey, foreign_key: true)
    add_index :visits, %i[survey_id user_id name], unique: true
  end
end
