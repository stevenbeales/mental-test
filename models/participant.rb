# frozen_string_literal: true
require 'validates_email_format_of'

# Model to represent survey participants
class Participant < ApplicationRecord
  belongs_to :user, optional: true
  validates_email_format_of :email, message: 'is not a valid email'

  def to_s
    "#{identifier} #{email}"
  end
end
