# frozen_string_literal: true

# Represents an application user/respondent
# Users are linked to Alexa users via Account Linking
class User < ActiveRecord::Base
  has_many :assessments, dependent: :destroy
  validates :username, presence: true
  validates_uniqueness_of :username
  
  def self.authenticate(user_id)
    User.find_or_create_by(username: user_id)
  end

  def to_s
    username
  end
end
