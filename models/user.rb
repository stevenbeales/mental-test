# frozen_string_literal: true

# Represents an application user/respondent
# Users are linked to Alexa users via Account Linking
class User < ActiveRecord::Base
  validates :username, presence: true
  validates_uniqueness_of :username
  attr_accessor :access_token

  AMAZON_API_URL = 'https://api.amazon.com/user/profile'

  def to_s
    username
  end

  def self.authenticate(access_token, client = Net::HTTP)
    uri = URI.parse("#{AMAZON_API_URL}?access_token=#{access_token}")
    first_name = JSON.parse(client.get(uri))['name'].split(' ').first
    first_or_create(username: first_name, access_token: access_token)
  end
end
