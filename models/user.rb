# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  username     :string           not null
#  firstname    :string
#  lastname     :string
#  access_token :text             default(""), not null
#  preferences  :jsonb            not null
#  created_at   :datetime         default(2018-02-23 00:00:00 UTC), not null
#  updated_at   :datetime         default(2018-02-23 00:00:00 UTC), not null
#


# Represents an application user/respondent
# Users are linked to Alexa users using Alexa session request.user_id
class User < ActiveRecord::Base
  # has_paper_trail

  has_many :surveys, through: :user_surveys
  has_many :assessments, dependent: :destroy

  validates :username, presence: true
  validates_uniqueness_of :username
  validates_length_of :username, \
                      within: 5..20, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'
   
  def self.authenticate(user_id)
    User.find_or_create_by(username: user_id)
  end

  def to_s
    username
  end
end
