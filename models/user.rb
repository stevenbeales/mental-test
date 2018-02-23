# frozen_string_literal: true

# Represents an application user/respondent
# Users are linked to Alexa users via Account Linking
class User < ActiveRecord::Base
  validates :username, presence: true
  validates_uniqueness_of :username
  validates_length_of :username, :within => 5..20, \
                      :too_long => "pick a shorter name", :too_short => "pick a longer name"
   
  def self.authenticate(user_id)
    User.find_or_create_by(username: user_id)
  end

  def to_s
    username
  end
end
