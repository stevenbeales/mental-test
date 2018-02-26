# frozen_string_literal: true

# Model to represent a user visit or an attempt in a self assessment
class Visit < ActiveRecord::Base
  belongs_to :user, inverse_of: :visits 
  belongs_to :survey, inverse_of: :visits 
  has_many :assessments, dependent: :destroy
  validates :user, presence: true
  validates_uniqueness_of :name, scope: :user 
end
 