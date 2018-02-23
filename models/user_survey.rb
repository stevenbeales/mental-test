# frozen_string_literal: true

# Association class between users and surveys
class UserSurvey < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  validates :user, presence: true
  validates :survey, presence: true
end
