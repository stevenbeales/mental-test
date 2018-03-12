# frozen_string_literal: true

require 'validates_email_format_of'

# Model to represent survey participants
class Participant < ApplicationRecord
  belongs_to :user, optional: true
  validates_email_format_of :email, message: 'is not a valid email'
  has_many :participant_surveys, inverse_of: :participant, dependent: :destroy
  has_many :surveys, through: :participant_surveys
  
 

  def to_s
    "#{identifier} #{email}".strip
  end
end
