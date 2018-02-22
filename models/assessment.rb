# frozen_string_literal: true

# Model to represent the user taking an instrument/questionnaire within a survey/campaign
class Assessment < ActiveRecord::Base
  has_many :instruments
  belongs_to :survey
  belongs_to :user
end
 