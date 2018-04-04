# frozen_string_literal: true

# Model to represent studies
class Study < ApplicationRecord
  has_one :schedule, inverse_of: :study, dependent: :destroy
  has_many :study_participants, inverse_of: :study, dependent: :destroy
  has_many :participants, through: :study_participants

  validates :name, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..50, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'
  
  def to_s
    name
  end
end

# == Schema Information
#
# Table name: studies
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_studies_on_name  (name)
#
