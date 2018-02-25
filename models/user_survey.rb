# frozen_string_literal: true

# == Schema Information
#
# Table name: user_surveys
#
#  id        :integer          not null, primary key
#  user_id   :integer          not null
#  survey_id :integer          not null
#

# Association class between users and surveys
class UserSurvey < ActiveRecord::Base
  # has_paper_trail

  belongs_to :user
  belongs_to :survey

  validates :user, presence: true
  validates :survey, presence: true
end
