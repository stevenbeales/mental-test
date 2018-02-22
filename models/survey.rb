# frozen_string_literal: true

require './lib/shared_methods'

# Model to represent a survey/campaign
class Survey < ActiveRecord::Base
  extend SharedMethods
  has_many :assessments, dependent: :destroy
  validates :name, presence: true
  validates_uniqueness_of :name

  def self.list_tests
    get_test_names(Survey.all)
  end

  def to_s
    name
  end
end
 