# frozen_string_literal: true

# == Schema Information
#
# Table name: instruments
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  version    :string           not null
#  content    :jsonb            not null
#  created_at :datetime         default(2018-02-23 00:00:00 UTC), not null
#  updated_at :datetime         default(2018-02-23 00:00:00 UTC), not null

require 'acts-as-taggable-array-on'
require 'jsonb_accessor'

# Represents a psychometric instrument
# Similar to a survey or questionnaire
class Instrument < ApplicationRecord
  # has_paper_trail
  acts_as_taggable_array_on :tags

  has_many :assessment_instruments, inverse_of: :instrument, dependent: :destroy
  has_many :study_event_instruments, inverse_of: :instrument, dependent: :destroy
  has_many :assessments, inverse_of: :instrument, through: :assessment_instruments
  has_many :study_events, inverse_of: :instrument, through: :study_event_instruments
  has_many :items, inverse_of: :instrument, dependent: :destroy
  
  jsonb_accessor :content,
                 title: [:string, default: 'Untitled'],
                 pages: [:jsonb, array: true, default: []]
  
  validates :name, presence: true
  validates_uniqueness_of :name
  validates_length_of :name, \
                      within: 2..50, \
                      too_long: 'pick a shorter name', \
                      too_short: 'pick a longer name'
 
  def self.list_tests(limit: 4)
    Instrument.order(:name).limit(limit).join(' ')
  end

  def to_s
    name
  end
end
