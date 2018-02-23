# frozen_string_literal: true

require './lib/shared_methods'

# Model to represent a survey/campaign
class Survey < ActiveRecord::Base
  extend SharedMethods
  has_many :assessments, dependent: :destroy
  has_many :users, through: :user_surveys
  validates :name, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..50, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'

  def self.list_tests
    get_test_names(Survey.all)
  end

  def to_s
    name
  end
end
 